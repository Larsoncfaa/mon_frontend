from datetime import timedelta
from decimal import Decimal


from django.utils import timezone
from django.contrib.auth.password_validation import validate_password
from django.db import transaction, IntegrityError
from django.db.models import Q, Sum, Case, When, IntegerField, F
from requests import Response
from rest_framework import serializers
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _
from drf_spectacular.utils import extend_schema_field
from drf_spectacular.utils import OpenApiTypes
from django.db.models import DecimalField

from api.enums import UserRole

from .models import (
    Cart, CartItem, CustomUser, Category, Product, Selection,  Supplier,
    Warehouse, Batch, StockLevel, StockMovement,
    ClientProfile, Order, OrderLine, Invoice,
    ExchangeRequest, Notification,
    PromoCode, ProductDiscount, PaymentLog, Payment,
    Delivery, TrackingInfo, Proof,
    StockAlert, ProductReview, RefundRequest,
    LoyaltyProgram, DeliveryPerson,
)

User = get_user_model()


# ----------- User serializers -----------

class RegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, validators=[validate_password])
    role = serializers.ChoiceField(
        choices=[(r.name, r.value) for r in UserRole],
        write_only=True,
        help_text="'agriculteur', 'client' ou 'livreur'"
    )

    
    
    class Meta:
        model = CustomUser
        fields = ('first_name', 'last_name', 'email', 'password','role')

    def validate_email(self, value):
        if CustomUser.objects.filter(email=value.lower()).exists():
            raise serializers.ValidationError(_("Email déjà utilisé"))
        return value.lower()

    def create(self, validated_data):
        role = validated_data.pop('role')  # récupère et enlève du dict
        user = CustomUser(
            email=validated_data['email'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            is_verified=True,
    )
        user.set_password(validated_data['password'])

    # Attribuer le rôle
        if role == UserRole.agriculteur.name:
            user.is_agriculteur = True
        elif role == UserRole.client.name:
            user.is_client = True
        elif role == UserRole.livreur.name:
            user.is_livreur = True

        user.save()
        return user



class LoginSerializer(serializers.Serializer):
    login = serializers.CharField()
    password = serializers.CharField(write_only=True)

    def validate(self, data):
        login = data['login'].lower()
        password = data['password']
        user = CustomUser.objects.filter(Q(email=login) | Q(username=login)).first()
        if not user or not user.check_password(password):
            raise serializers.ValidationError(_("Identifiants invalides"))
        if not user.is_verified:
            raise serializers.ValidationError(_("Compte non vérifié"))
        data['user'] = user
        return data


# ----------- Core serializers -----------

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']


class ProductSerializer(serializers.ModelSerializer):
    average_rating = serializers.SerializerMethodField()
    category = serializers.CharField()
    category_name = serializers.CharField(source='category.name', read_only=True)
    image = serializers.ImageField(read_only=True)
    owner = serializers.PrimaryKeyRelatedField(read_only=True)  # 🔒 ← Empêche la soumission manuelle
    quantity_in_stock = serializers.SerializerMethodField()
    movements = serializers.SerializerMethodField()

    class Meta:
        model = Product
        fields = '__all__'

    def get_average_rating(self, obj):
        return obj.average_rating
    
    def get_quantity_in_stock(self, obj):
        return obj.quantity_in_stock

    def get_movements(self, obj):
        """
        Derniers mouvements non archivés pour le produit.
        """
        qs = StockMovement.objects.filter(product=obj, is_archived=False).order_by('-timestamp')[:10]
        return [
            {
                'id': m.id,
                'type': m.movement_type,
                'quantity': m.quantity,
                'date': m.timestamp.isoformat()
            } for m in qs
        ]

    def validate_category(self, value):
        try:
            return Category.objects.get(name=value)
        except Category.DoesNotExist:
            raise serializers.ValidationError("La catégorie spécifiée n'existe pas.")
    
    def validate(self, data):
        name = data.get('name')
        category = data.get('category')  # C’est déjà un objet Category grâce à validate_category

        if name and category:
            queryset = Product.objects.filter(name=name, category=category)

            if self.instance:
                queryset = queryset.exclude(pk=self.instance.pk)

            if queryset.exists():
                raise serializers.ValidationError({
                    'non_field_errors': ['Un produit avec ce nom existe déjà dans cette catégorie.']
                })

        return data

    def to_representation(self, instance):
        rep = super().to_representation(instance)
        # Convertit les DecimalField en float
        for field in instance._meta.get_fields():
            if hasattr(field, 'name') and isinstance(getattr(instance, field.name, None), Decimal):
                val = getattr(instance, field.name)
                if field.name in rep and val is not None:
                    rep[field.name] = float(val)
        return rep

class PublicProductSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    owner_name = serializers.CharField(source='owner.username', read_only=True)
    image_url = serializers.SerializerMethodField()

    class Meta:
        model = Product
        fields = [
            'id', 'name', 'category', 'description', 'image_url',
            'quantity_in_stock', 'unit', 'selling_price', 'expiration_date',
            'owner_name'
        ]

    def get_image_url(self, obj):
        request = self.context.get('request')
        if obj.image and request:
            return request.build_absolute_uri(obj.image.url)
        return None
    
class SelectionSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Selection
        fields = ['id', 'product', 'image', 'quantity', 'name', 'selling_price', 'description', 'expiration_date', 'category', 'created_at']
        extra_kwargs = {
            'created_at': {'read_only': True},  # Ne permet pas à l'utilisateur de définir la date de création
        }

   

    def to_representation(self, instance):
        # Personnalisation de la manière dont l'objet est renvoyé (pour correspondre à l'API Flutter)
        representation = super().to_representation(instance)
        representation['selling_price'] = str(instance.selling_price)  # Convertir en chaîne pour correspondre au modèle Flutter
        if instance.expiration_date:
            representation['expiration_date'] = instance.expiration_date.isoformat()
        if instance.created_at:
            representation['created_at'] = instance.created_at.isoformat()
        return representation

class SupplierSerializer(serializers.ModelSerializer):
    class Meta:
        model = Supplier
        fields = ['id', 'name', 'contact', 'product_type', 'address', 'date_added']


# ----------- Inventory serializers -----------

class WarehouseSerializer(serializers.ModelSerializer):
    owner = serializers.PrimaryKeyRelatedField(read_only=True)
    class Meta:
        model = Warehouse
        fields = ['id', 'name', 'location', 'owner']

    


class BatchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Batch
        fields = ['id', 'product', 'lot_number', 'expiration_date']

    def validate_product(self, value):
        if value.owner != self.context['request'].user:
            raise serializers.ValidationError("Ce produit ne vous appartient pas.")
        return value


class StockLevelSerializer(serializers.ModelSerializer):
    class Meta:
        model = StockLevel
        fields = ['id', 'product', 'warehouse', 'quantity']


class StockMovementSerializer(serializers.ModelSerializer):
    product_name = serializers.CharField(source='product.name', read_only=True)

    
    movement_type_display = serializers.SerializerMethodField()

    @extend_schema_field(serializers.CharField())
    def get_movement_type_display(self, obj):
        return obj.get_movement_type_display()

    
    class Meta:
        model = StockMovement
        fields = ['id', 'product', 'product_name', 'warehouse', 'batch', 'movement_type_display','movement_type', 'quantity', 'timestamp', 'user', 'is_archived']
        read_only_fields = ['id', 'timestamp', 'movement_type_display', 'user' ]

    def create(self, validated_data):
        validated_data['user'] = self.context['request'].user
        return super().create(validated_data)

    def update(self, instance, validated_data):
        validated_data['user'] = self.context['request'].user
        return super().update(instance, validated_data)

    def validate(self, data):
        user = self.context['request'].user

        # On récupère depuis les données ou l'instance existante
        product = data.get('product') or getattr(self.instance, 'product', None)
        warehouse = data.get('warehouse') or getattr(self.instance, 'warehouse', None)
        batch = data.get('batch') or getattr(self.instance, 'batch', None)

        errors = {}

        if product is not None and product.owner != user:
            errors['product'] = "Vous ne pouvez déplacer du stock que pour vos propres produits."

        if warehouse is not None and warehouse.owner != user:
            errors['warehouse'] = "Vous ne pouvez utiliser qu'un entrepôt que vous possédez."

        if batch is not None and batch.product.owner != user:
            errors['batch'] = "Ce lot n’appartient pas à l’un de vos produits."

        if errors:
            raise serializers.ValidationError(errors)

        return data
    
# ----------- Client & order serializers -----------

class ClientProfileSerializer(serializers.ModelSerializer):
    points = serializers.IntegerField(source='loyalty.points', read_only=True)
    balance = serializers.FloatField()

    class Meta:
        model = ClientProfile
        fields = ['id', 'user', 'location', 'balance', 'points']

    def get_points(self, obj):
        return obj.loyalty.points if obj.loyalty else 0


class OrderLineSerializer(serializers.ModelSerializer):
    product = ProductSerializer(read_only=True)
    unit_price = serializers.FloatField() 

    class Meta:
        model = OrderLine
        fields = ['id', 'product', 'quantity', 'unit_price']
        read_only_fields = ['unit_price']

class OrderLineWriteSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderLine
        fields = ['product', 'quantity',]

    def create(self, validated_data):
        lines_data = validated_data.pop('lines')
        with transaction.atomic():
            order = Order.objects.create(**validated_data)
            for ln in lines_data:
                OrderLine.objects.create(order=order, **ln)
        return order
    
class OrderSerializer(serializers.ModelSerializer):
    client = ClientProfileSerializer(read_only=True)
    lignes_commandes = OrderLineSerializer(many=True, read_only=True)
    total = serializers.SerializerMethodField()

    class Meta:
        model = Order
        fields = ['id', 'client', 'date_ordered', 'order_status', 'total', 'lignes_commandes']

    def get_total(self, obj):
        return float(obj.total) if obj.total is not None else 0.0


class OrderWriteSerializer(serializers.ModelSerializer):
    lignes_commandes = OrderLineWriteSerializer(many=True)

    class Meta:
        model = Order
        fields = ['client', 'order_status', 'lignes_commandes']

    def create(self, validated_data):
        lines_data = validated_data.pop('lignes_commandes')
        with transaction.atomic():
            order = Order.objects.create(**validated_data)
            for ln in lines_data:
                OrderLine.objects.create(order=order, **ln)
        return order


class InvoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Invoice
        fields = ['id', 'order', 'pdf', 'issued_at']





class ExchangeRequestSerializer(serializers.ModelSerializer):
    reason = serializers.CharField(source='refund_request.reason', read_only=True)
    requested_product = serializers.CharField(source='replacement.name', read_only=True)
    class Meta:
        model = ExchangeRequest
        fields = ['id', 'replacement', 'exchange_status', 'refund_request', 'reason', 'requested_product']


# ----------- Notifications & promotions -----------

class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = ['id', 'user', 'message', 'link', 'read', 'created_at']


class PromoCodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = PromoCode
        fields = ['id', 'code', 'discount_percent', 'valid_from', 'valid_to', 'usage_limit']


class ProductDiscountSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductDiscount
        fields = ['id', 'product', 'discount_percent']
        read_only_fields = ['id']


# ----------- Payments & deliveries -----------

class PaymentLogSerializer(serializers.ModelSerializer):
    class Meta:
        model = PaymentLog
        fields = ['id', 'order', 'attempt_time', 'payment_status', 'amount', 'info']


class PaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payment
        fields = ['id', 'order', 'method', 'amount', 'payment_status', 'paid_at']

    def validate(self, data):
        order = data['order']
        client_profile = order.client
        if data['method'] == 'BALANCE':
            if client_profile.balance < data['amount']:
                raise serializers.ValidationError(_("Solde insuffisant"))
        paid = order.payments.filter(payment_status='PAID').aggregate(sum=Sum('amount'))['sum'] or 0
        if data['amount'] > (order.total - paid):
            raise serializers.ValidationError(_("Montant supérieur au solde dû"))
        return data

    def create(self, validated_data):
        payment = super().create(validated_data)
        if payment.method == 'BALANCE' and payment.payment_status == 'PAID':
            client_profile = payment.order.client
            client_profile.balance -= payment.amount
            client_profile.save(update_fields=['balance'])
        return payment
        
        


class TrackingInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TrackingInfo
        fields = ['id', 'delivery', 'tracking_status', 'location', 'timestamp']


class ProofSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proof
        fields = ['id', 'delivery', 'image', 'uploaded_at']


class DeliverySerializer(serializers.ModelSerializer):
    deliverer = serializers.PrimaryKeyRelatedField(queryset=User.objects.all(), required=False)
    deliverer_name = serializers.SerializerMethodField()

    order = serializers.PrimaryKeyRelatedField(queryset=Order.objects.all(), required=False)
    order_reference = serializers.SerializerMethodField()

    product = serializers.PrimaryKeyRelatedField(queryset=Product.objects.all(), required=False)
    product_name = serializers.SerializerMethodField()

    class Meta:
        model = Delivery
        fields = [
            'id',
            'deliverer',
            'deliverer_name',
            'order',
            'order_reference',
            'product',
            'product_name',
            'type',
            'delivery_status',
            'description',
            'created_at',
            'updated_at',
            'latitude',
            'longitude',
        ]

    def get_deliverer_name(self, obj):
        if obj.deliverer:
            return obj.deliverer.get_full_name() or obj.deliverer.username
        return None

    def get_order_reference(self, obj):
        if obj.order:
            return f"Commande #{obj.order.id}"  # ou obj.order.reference si tu as un champ unique
        return None

    def get_product_name(self, obj):
        if obj.product:
            return obj.product.name
        return None


# ----------- Stock alerts, reviews, refunds, loyalty -----------

class StockAlertSerializer(serializers.ModelSerializer):
     # Champs en lecture seule pour afficher les objets complets
    product = ProductSerializer(read_only=True)
    warehouse = WarehouseSerializer(read_only=True)

    # Champs en écriture pour accepter les IDs côté frontend
    product_id = serializers.PrimaryKeyRelatedField(
        queryset=Product.objects.all(), source='product', write_only=True
    )
    warehouse_id = serializers.PrimaryKeyRelatedField(
        queryset=Warehouse.objects.all(), source='warehouse', write_only=True
    )

    class Meta:
        model = StockAlert
        fields = [
            'id', 'product', 'product_id',
            'warehouse', 'warehouse_id',
            'threshold', 'is_active'
        ]


class ProductReviewSerializer(serializers.ModelSerializer):

    class Meta:
        model = ProductReview
        fields = ['id', 'client', 'product', 'rating', 'comment', 'created_at', 'verified_purchase']
        read_only_fields = ['id', 'client', 'created_at', 'verified_purchase']

    def create(self, validated_data):
        user = self.context['request'].user
        try:
            client = user.profil_client
        except AttributeError:
            raise serializers.ValidationError("L'utilisateur connecté n'a pas de profil client.")

        validated_data['client'] = client
        # Si tu as un champ verified_purchase et que tu veux le fixer à True par défaut:
        validated_data['verified_purchase'] = True

        return super().create(validated_data)

    def update(self, instance, validated_data):
        user = self.context['request'].user
        if instance.client != user.profil_client:
            raise serializers.ValidationError("Vous ne pouvez modifier que vos propres avis.")

        instance.rating = validated_data.get('rating', instance.rating)
        instance.comment = validated_data.get('comment', instance.comment)
        instance.save()
        return instance

        
    #def validate(self, data):
       # request = self.context.get('request')
       # client = None

        # 🔍 Vérifie que l'utilisateur a un profil client
        #if request and hasattr(request.user, 'profil_client'):
            #client = request.user.profil_client
        #else:
            #raise serializers.ValidationError(_("Aucun profil client associé à cet utilisateur."))

        #product = data.get('product')
        #if not product:
            #raise serializers.ValidationError(_("Le produit est obligatoire."))

        # ✅ Vérifie si le client a déjà commandé ce produit avec une commande livrée
        #has_purchased = Order.objects.filter(
            #client=client,
           # lignes_commandes__product=product,  # <- relation correcte
           # order_status=Order.DELIVERED
       #).exists()

        #if not has_purchased:
            #raise serializers.ValidationError(_("Le client doit avoir acheté ce produit."))

        # ✅ Injection des valeurs calculées
        #data['verified_purchase'] = True
        #data['client'] = client

        #return data
    
class RefundRequestSerializer(serializers.ModelSerializer):
    days_remaining = serializers.SerializerMethodField()

    class Meta:
        model = RefundRequest
        fields = '__all__'
        read_only_fields = ('refund_status', 'requested_at', 'processed_at')

    @extend_schema_field(int)
    def get_days_remaining(self, obj):
        if obj.order.status != Order.DELIVERED:
            return 0
        delta = (obj.order.date_ordered + timedelta(days=14)) - timezone.now()
        return max(delta.days, 0)

    def validate_evidence(self, value):
        max_size = 2 * 1024 * 1024  # 2 Mo
        if value.size > max_size:
            raise serializers.ValidationError("Fichier trop volumineux (max 2 Mo)")
        return value

    def validate(self, attrs):
        order = attrs.get('order')

        if order.payment_status != 'PAID':
            raise serializers.ValidationError("Le remboursement n'est possible que pour une commande payée.")

        if order.status != Order.DELIVERED:
            raise serializers.ValidationError("Le remboursement n'est possible que pour une commande livrée.")

        return attrs

class LoyaltyProgramSerializer(serializers.ModelSerializer):
    class Meta:
        model = LoyaltyProgram
        fields = ['id', 'client', 'points', 'last_updated', 'transactions']
        read_only_fields = ['points', 'last_updated', 'transactions', 'requested_by']


# ----------- Analytics input serializers -----------

class DeliveryInputSerializer(serializers.Serializer):
    delivery_id = serializers.IntegerField()
    livreur_id = serializers.IntegerField()

class InventoryInputSerializer(serializers.Serializer):
    product_id = serializers.IntegerField(help_text="ID du produit")
    window_days = serializers.IntegerField(
        default=30, min_value=1,
        help_text="Nombre de jours passés pour la prédiction de stock"
    )


class SalesInputSerializer(serializers.Serializer):
    product_id = serializers.IntegerField(help_text="ID du produit")
    history_days = serializers.IntegerField(
        default=30, min_value=1,
        help_text="Nombre de jours d'historique de ventes à considérer"
    )
    forecast_days = serializers.IntegerField(
        default=30, min_value=1,
        help_text="Nombre de jours à prédire"
    )


class CustomUserSerializer(serializers.ModelSerializer):
    role = serializers.SerializerMethodField()

    class Meta:
        model = CustomUser
        fields = [
            'id', 'username', 'email', 'first_name', 'last_name',
            'is_verified', 'is_agriculteur', 'is_livreur', 'is_client', 'language','role'
        ]
        read_only_fields = ['id', 'username', 'is_verified', 'is_agriculteur', 'is_livreur', 'is_client']

    def get_role(self, obj):
        if obj.is_agriculteur:
            return 'agriculteur'
        if obj.is_client:
            return 'client'
        if obj.is_livreur:
            return 'livreur'
        return None


class LogoutSerializer(serializers.Serializer):
    # Aucun champ requis si c’est juste une déconnexion
    message = serializers.CharField(read_only=True)

class DeliveryPredictSerializer(serializers.Serializer):
    product_id = serializers.IntegerField()
    quantity = serializers.IntegerField()

    prediction = serializers.CharField(read_only=True)

class InventoryPredictSerializer(serializers.Serializer):
    product_id = serializers.IntegerField()
    days = serializers.IntegerField()

    predicted_inventory = serializers.IntegerField(read_only=True)

class SalesPredictSerializer(serializers.Serializer):
    product_id = serializers.IntegerField()
    period = serializers.CharField()  # exemple : '7_days', '1_month', etc.

    predicted_sales = serializers.IntegerField(read_only=True)


class ProfileSerializer(serializers.ModelSerializer):
    role = serializers.SerializerMethodField()
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'first_name', 'last_name','role']

    @extend_schema_field(serializers.CharField())
    def get_role(self, obj):
        if obj.is_agriculteur:
            return 'agriculteur'
        elif obj.is_livreur:
            return 'livreur'
        elif obj.is_client:
            return 'client'
        return None


class CartItemSerializer(serializers.ModelSerializer):
    product = ProductSerializer(read_only=True)
    product_id = serializers.PrimaryKeyRelatedField(
        queryset=Product.objects.all(), source='product', write_only=True
    )
    total_price = serializers.SerializerMethodField()

    class Meta:
        model = CartItem
        fields = ['id', 'product', 'product_id', 'quantity', 'total_price']
        read_only_fields = ['total_price']

    def validate_quantity(self, value):
        if value <= 0:
            raise serializers.ValidationError(_("La quantité doit être supérieure à zéro."))
        return value

    def get_total_price(self, obj):
        # Utilisation de la méthode `total_price()` du modèle CartItem pour calculer le prix total
        return obj.total_price()

class CartSerializer(serializers.ModelSerializer):
    items = CartItemSerializer(many=True, read_only=True)
    total = serializers.SerializerMethodField()

    class Meta:
        model = Cart
        fields = ['id', 'user', 'items', 'total', 'created_at', 'updated_at']
        read_only_fields = ['user', 'total', 'created_at', 'updated_at']

    def get_total(self, obj) -> float:
        return float(obj.total())

class DeliveryPersonSerializer(serializers.ModelSerializer):
    user_name = serializers.SerializerMethodField()
    agriculteur_name = serializers.SerializerMethodField()

    class Meta:
        model = DeliveryPerson
        fields = [
            'id',
            'user',
            'user_name',
            'agriculteur',
            'agriculteur_name',
            'phone',
        ]

    def get_user_name(self, obj):
        return obj.user.get_full_name() or obj.user.username

    def get_agriculteur_name(self, obj):
        if obj.agriculteur:
            return obj.agriculteur.get_full_name() or obj.agriculteur.username
        return None