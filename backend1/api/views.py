from datetime import timedelta
from random import randint
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters
from rest_framework import permissions

from api.services.order_service import create_order_from_cart
from .filters import InvoiceFilter, StockMovementFilter
from rest_framework.decorators import api_view


from django.core.exceptions import PermissionDenied, ValidationError
from django.db.models import Sum, Count, F
from django.utils import timezone
from django.utils.timezone import now
from django.utils.translation import gettext as _
from django.db.models.functions import TruncDay

from rest_framework import generics, status, viewsets
from rest_framework.generics import RetrieveUpdateDestroyAPIView
from rest_framework.decorators import action, permission_classes
from rest_framework.pagination import PageNumberPagination
from rest_framework.exceptions import NotFound, PermissionDenied
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated, AllowAny

from rest_framework_simplejwt.tokens import RefreshToken
from drf_spectacular.utils import extend_schema, OpenApiResponse
from drf_spectacular.utils import inline_serializer



from .models import (
    CustomUser, DeliveryTracking, Product, Selection, Supplier, Order, OrderLine,
    ClientProfile as Client, Category, ProductReview, RefundRequest,
    LoyaltyProgram, Delivery, Payment, Warehouse, Batch,
    StockLevel, StockMovement, Invoice, 
    ExchangeRequest, Notification, PromoCode, ProductDiscount,
    PaymentLog, TrackingInfo, Proof, StockAlert, Cart, CartItem, DeliveryPerson
)
from .serializers import (
    DeliveryPersonSerializer, PublicProductSerializer, RegistrationSerializer, LoginSerializer, ProductSerializer,
    DeliverySerializer,  SelectionSerializer,  SupplierSerializer, OrderSerializer,
    OrderLineSerializer, OrderWriteSerializer, CategorySerializer,
    ProductReviewSerializer, RefundRequestSerializer, LoyaltyProgramSerializer,
    PaymentSerializer, WarehouseSerializer, BatchSerializer,
    StockLevelSerializer, StockMovementSerializer, InvoiceSerializer,
     ExchangeRequestSerializer,
    NotificationSerializer, PromoCodeSerializer, ProductDiscountSerializer,
    PaymentLogSerializer, TrackingInfoSerializer, ProofSerializer,
    StockAlertSerializer, ClientProfileSerializer as ClientSerializer,
    DeliveryInputSerializer,
     CustomUserSerializer,
    LogoutSerializer, 
     ProfileSerializer,
    CartSerializer, CartItemSerializer, 
)
from .permissions import IsAdminOrDelivererOrOrderOwner, IsOwnerAgriculteur
from django.shortcuts import render

from api import serializers


# ----------- Authentification -----------

class RegistrationAPI(APIView):
    permission_classes = [AllowAny]
    serializer_class = RegistrationSerializer

    @extend_schema(
        request=RegistrationSerializer,
        responses={201: OpenApiResponse(response=RegistrationSerializer)}
    )
    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        refresh = RefreshToken.for_user(user)
        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
            'user': {'id': user.id, 'username': user.username, 'email': user.email}
        }, status=status.HTTP_201_CREATED)

class LoginAPI(APIView):
    permission_classes = [AllowAny]
    serializer_class = LoginSerializer

    @extend_schema(
        request=LoginSerializer,
        responses={200: OpenApiResponse(response=LoginSerializer)}
    )
    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        refresh = RefreshToken.for_user(user)

        user_data = CustomUserSerializer(user).data  # ← on utilise bien le serializer ici

        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
            'user': user_data
        })

# ----------- Pagination -----------

class ProductPagination(PageNumberPagination):
    page_size = 20
    page_size_query_param = 'page_size'
    max_page_size = 100


# ----------- Produits -----------

class ProductListCreateAPIView(generics.ListCreateAPIView):
    serializer_class = ProductSerializer
    permission_classes = [IsAuthenticated]
    pagination_class = ProductPagination

    def get_queryset(self):
        return Product.objects.filter(owner=self.request.user).order_by('-id')

    @extend_schema(
        request=ProductSerializer,
        responses={201: OpenApiResponse(response=ProductSerializer)}
    )
    def perform_create(self, serializer):
        try:
            serializer.save(owner=self.request.user)
        except ValidationError as e:
            raise PermissionDenied(e.message_dict)

class ProductRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Product.objects.filter(owner=self.request.user)

@api_view(['GET'])
def check_product_duplicate(request):
    name = request.query_params.get('name')
    category = request.query_params.get('category')
    exclude_id = request.query_params.get('exclude_id')

    if not name or not category:
        return Response(
            {'detail': 'Les paramètres "name" et "category" sont requis.'},
            status=status.HTTP_400_BAD_REQUEST
        )

    # Recherche du produit
    qs = Product.objects.filter(name=name, category__name=category)
    if exclude_id:
        qs = qs.exclude(id=exclude_id)

    exists = qs.exists()

    return Response({'exists': exists})

class PublicProductListAPIView(generics.ListAPIView):
    queryset = Product.objects.all().order_by('-id')
    serializer_class = PublicProductSerializer
    permission_classes = [AllowAny]  # ou IsAuthenticated si nécessaire
    pagination_class = ProductPagination

    def get_queryset(self):
        return Product.objects.filter(owner=self.request.user)

class SelectionViewSet(viewsets.ModelViewSet):
    queryset = Selection.objects.all().order_by('id')
    serializer_class = SelectionSerializer
    permission_classes = [IsAuthenticated]  # Assure-toi que l'utilisateur est authentifié

    def perform_create(self, serializer):
        # On peut ajouter des actions supplémentaires ici si nécessaire, comme l'ajout automatique de l'utilisateur
        serializer.save()

# ----------- Livraisons -----------


# ----------- Fournisseurs -----------

class SupplierListCreateAPIView(generics.ListCreateAPIView):
    queryset = Supplier.objects.all()
    serializer_class = SupplierSerializer
    permission_classes = [IsAuthenticated]
    


class SupplierDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Supplier.objects.all()
    serializer_class = SupplierSerializer
    permission_classes = [IsAuthenticated]


# ----------- Commandes -----------

class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.prefetch_related('lignes_commandes').all()
    permission_classes = [IsAuthenticated]

    def get_serializer_class(self):
        if self.action in ['create', 'update', 'partial_update']:
            return OrderWriteSerializer
        return OrderSerializer

    @action(detail=False, methods=['post'], url_path='create-from-cart')
    def create_from_cart(self, request):
        try:
            order = create_order_from_cart(request.user)
            serializer = self.get_serializer(order)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        except ValidationError as e:
            return Response({'detail': str(e)}, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            return Response({'detail': 'Erreur interne'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


# ----------- Dashboard -----------

class DashboardView(APIView):
    permission_classes = [IsAuthenticated]
    serializer_class = None

    @extend_schema(
        responses={200: OpenApiResponse(description="Données du dashboard", response=dict)}
    )
    def get(self, request):
        total_stock = Product.objects.aggregate(total=Sum('quantity_in_stock'))['total'] or 0
        expiring_soon = Product.objects.filter(
            expiration_date__range=(timezone.now(), timezone.now() + timedelta(days=7))
        ).count()
        sales_trend = {
            (timezone.now() - timedelta(days=i)).strftime('%Y-%m-%d'): randint(0, 100)
            for i in range(30)
        }
        return Response({
            'total_stock': total_stock,
            'expiring_soon': expiring_soon,
            'sales_trend': sales_trend
        })


# ----------- Prédictions IA générales -----------




# ----------- IA spécifiques -----------







# ----------- Reviews / Refunds / Loyalty / Payments -----------

class ProductReviewCreateView(generics.CreateAPIView):
    queryset = ProductReview.objects.all()
    serializer_class = ProductReviewSerializer
    permission_classes = [IsAuthenticated]


class RefundRequestListCreateAPIView(generics.ListCreateAPIView):
    serializer_class = RefundRequestSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        try:
            client = Client.objects.get(user=self.request.user)
        except Client.DoesNotExist:
            return RefundRequest.objects.none()
        return RefundRequest.objects.filter(order__client=client)

    def perform_create(self, serializer):
        order = serializer.validated_data.get("order")

        if order.client != self.request.user:
            raise PermissionDenied("Vous ne pouvez pas demander un remboursement pour une commande qui ne vous appartient pas.")

        if order.payment_status != 'PAID':
            raise ValidationError("Le remboursement n'est possible que pour une commande payée.")

        if order.status != Order.DELIVERED:
            raise ValidationError("La commande doit être livrée pour demander un remboursement.")

        serializer.save()
class RefundRequestDetailAPIView(generics.RetrieveUpdateAPIView):
    serializer_class = RefundRequestSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return RefundRequest.objects.filter(order__client=self.request.user)

    def perform_update(self, serializer):
        # Ne mettre à jour processed_at que si refund_status est modifié
        if 'refund_status' in serializer.validated_data:
            serializer.save(processed_at=timezone.now())
        else:
            serializer.save()

class LoyaltyProgramDetailView(generics.RetrieveAPIView):
    serializer_class = LoyaltyProgramSerializer
    permission_classes = [IsAuthenticated]

    @extend_schema(responses={200: OpenApiResponse(response=LoyaltyProgramSerializer)})
    def get(self, request):
        return Response(request.user.client_profile.loyalty.serialize())


class LoyaltyProgramListCreateAPIView(generics.ListCreateAPIView):
    queryset = LoyaltyProgram.objects.all()
    serializer_class = LoyaltyProgramSerializer
    permission_classes = [IsAuthenticated]
   


class PaymentCreateView(generics.CreateAPIView):
    serializer_class = PaymentSerializer
    permission_classes = [IsAuthenticated]

    @extend_schema(request=PaymentSerializer, responses={201: OpenApiResponse(response=PaymentSerializer)})
    def post(self, request):
        return super().post(request)


class LoyaltyUsePointsView(APIView):
    permission_classes = [IsAuthenticated]
    serializer_class = None

    @extend_schema(request=None, responses={200: OpenApiResponse(description='Points utilisés', response=dict)})
    def post(self, request):
        points = int(request.data.get('points', 0))
        loyalty = request.user.client_profile.loyalty
        try:
            loyalty.use_points(points)
            return Response({'success': True, 'new_balance': loyalty.points})
        except ValidationError as e:
            return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)


class LoyaltyHistoryView(APIView):
    permission_classes = [IsAuthenticated]
    serializer_class = None

    @extend_schema(responses={200: OpenApiResponse(description='Historique fidélité', response=dict)})
    def get(self, request):
        return Response(request.user.client_profile.loyalty.transactions)


# ----------- CRUD génériques (reste des entités) -----------

class OrderLineListCreateAPIView(generics.ListCreateAPIView):
    queryset = OrderLine.objects.all()
    serializer_class = OrderLineSerializer
    permission_classes = [IsAuthenticated]
    


class OrderLineDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = OrderLine.objects.all()
    serializer_class = OrderLineSerializer
    permission_classes = [IsAuthenticated]


class ClientListCreateAPIView(generics.ListCreateAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    permission_classes = [IsAuthenticated]
    


class ClientDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    permission_classes = [IsAuthenticated]


class CategoryListCreateAPIView(generics.ListCreateAPIView):
    queryset = Category.objects.order_by('id')
    serializer_class = CategorySerializer
    permission_classes = [IsAuthenticated]

class CategoryDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = [IsAuthenticated]
    

class CategoryDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = [IsAuthenticated]


class WarehouseListCreateAPIView(generics.ListCreateAPIView):
    queryset = Warehouse.objects.all()
    serializer_class = WarehouseSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        # Ne montrer que les entrepôts appartenant à l’agriculteur connecté
        user = self.request.user
        return Warehouse.objects.filter(owner=user)

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class WarehouseDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Warehouse.objects.all()
    serializer_class = WarehouseSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Warehouse.objects.filter(owner=self.request.user)


class BatchListCreateAPIView(generics.ListCreateAPIView):
    serializer_class = BatchSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        # Ne montrer que les lots dont le produit appartient à l’agriculteur connecté
        user = self.request.user
        return Batch.objects.filter(product__owner=user).order_by('id')

    def perform_create(self, serializer):
        product = serializer.validated_data['product']
        if product.owner != self.request.user:
            raise PermissionDenied("Vous ne pouvez créer un lot que pour vos propres produits.")
        serializer.save()


class BatchDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Batch.objects.all()
    serializer_class = BatchSerializer
    permission_classes = [IsAuthenticated]
    
    def get_queryset(self):
        return Batch.objects.filter(product__owner=self.request.user)


class StockLevelListAPIView(generics.ListAPIView):
    serializer_class = StockLevelSerializer
    permission_classes = [IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['product', 'warehouse']
    search_fields = ['product__name', 'warehouse__name']

    def get_queryset(self):
        qs = super().get_queryset()
        user = self.request.user
        if getattr(user, 'is_agriculteur', False):
            qs = qs.filter(product__owner=user)
        return qs

class StockMovementListCreateAPIView(generics.ListCreateAPIView):
    queryset = StockMovement.objects.all().order_by('-timestamp')
    serializer_class = StockMovementSerializer
    permission_classes = [IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    search_fields = ['product__name', 'warehouse__name', 'user__username']
    ordering_fields = ['timestamp', 'quantity']
    filterset_class = StockMovementFilter

    def get_serializer_class(self):
        if self.request.method == 'POST':
            return StockMovementSerializer
        return StockMovementSerializer
    @extend_schema(
        request=StockMovementSerializer,
        responses={201: OpenApiResponse(response=StockMovementSerializer)}
    )
    def perform_create(self, serializer):
        user = self.request.user
        # Bloquer clients et livreurs à la création
        if getattr(user, 'is_client', False):
            raise PermissionDenied("Les clients ne peuvent pas créer de mouvements de stock.")
        if getattr(user, 'is_livreur', False):
            raise PermissionDenied("Les livreurs ne peuvent pas créer de mouvements de stock.")
        # Le serializer.validate() s’assure déjà que
        # product.owner == user, warehouse.owner == user, batch.product.owner == user
        serializer.save(user=user)

    def get_queryset(self):
        user = self.request.user
        qs = StockMovement.objects.all()

        if getattr(user, 'is_agriculteur', False):
            qs = qs.filter(product__owner=user)
        elif getattr(user, 'is_client', False) or getattr(user, 'is_livreur', False):
            qs = qs.none()

        return qs
    
    @extend_schema(
    request=StockMovementSerializer,
    responses={200: StockMovementSerializer},
    description="Permet uniquement d'archiver un mouvement de stock (`is_archived=true`)."
)
    def partial_update(self, request, *args, **kwargs):
        instance = self.get_object()
        is_archived = request.data.get("is_archived")

        if is_archived is not None:
            instance.is_archived = is_archived
            instance.save()
            return Response(self.get_serializer(instance).data)

        return super().partial_update(request, *args, **kwargs)

class StockMovementDetailAPIView(generics.RetrieveUpdateAPIView):
    queryset = StockMovement.objects.all()
    serializer_class = StockMovementSerializer
    permission_classes = [IsAuthenticated]

    def delete(self, request, *args, **kwargs):
        """
        Au lieu de supprimer, on archive le mouvement de stock.
        """
        instance = self.get_object()
        instance.is_archived = True
        instance.save()
        return Response({'detail': 'Mouvement archivé avec succès.'}, status=status.HTTP_200_OK)

class StockOverviewAPIView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        is_agri = getattr(user, 'is_agriculteur', False)

        products = Product.objects.all()
        stock_levels = StockLevel.objects.all()
        alerts = StockAlert.objects.all()

        if is_agri:
            products = products.filter(owner=user)
            stock_levels = stock_levels.filter(product__owner=user)
            alerts = alerts.filter(product__owner=user)

        total_products = products.count()
        total_stock = stock_levels.aggregate(total=Sum('quantity'))['total'] or 0
        total_alerts = alerts.count()
        total_stock_value = stock_levels.aggregate(
            value=Sum(F('quantity') * F('product__purchase_price'))
        )['value'] or 0

        return Response({
            "total_products": total_products,
            "total_stock_quantity": total_stock,
            "total_stock_value": float(total_stock_value),
            "active_alerts": total_alerts,
        })

class StockStatsAPIView(APIView):
    permission_classes = [IsAuthenticated]

    

    def get(self, request):
        user = request.user
        movements = StockMovement.objects.filter(product__owner=user)
        # Produits les plus sortis
        top_products = (
            movements.filter(movement_type=StockMovement.OUT)
            .values('product__name')
            .annotate(total_out=Sum('quantity'))
            .order_by('-total_out')[:5]
        )
        # Ruptures de stock (nombre de sorties par produit)
        ruptures = (
            movements.filter(movement_type=StockMovement.OUT)
            .values('product__name')
            .annotate(nb_ruptures=Count('id'))
            .order_by('-nb_ruptures')[:5]
        )
        # Évolution du stock sur le mois courant
        this_month = now().month
        evolution = (
            movements.filter(timestamp__month=this_month)
            .annotate(day=TruncDay('timestamp'))
            .values('day')
            .annotate(total=Sum('quantity'))
            .order_by('day')
        )
        return Response({
            "top_products": list(top_products),
            "ruptures": list(ruptures),
            "evolution": list(evolution),
        })


class InvoiceListCreateAPIView(generics.ListCreateAPIView):
    queryset = Invoice.objects.all()
    serializer_class = InvoiceSerializer
    permission_classes = [IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.OrderingFilter]
    filterset_class = InvoiceFilter

    def get_queryset(self):
        qs = super().get_queryset()
        user = self.request.user
        # Si l'utilisateur est agriculteur, ne montrer que ses produits
        if hasattr(user, 'is_agriculteur') and user.is_agriculteur:
            # Si l'utilisateur est agriculteur, ne montrer que ses produits
            qs = qs.filter(order__lignes_commandes__product__owner=user)
        return qs
   


class InvoiceDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Invoice.objects.all()
    serializer_class = InvoiceSerializer
    permission_classes = [IsAuthenticated]
   



class ExchangeRequestListCreateAPIView(generics.ListCreateAPIView):
    serializer_class = ExchangeRequestSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        try:
            client = Client.objects.get(user=self.request.user)
        except Client.DoesNotExist:
            return ExchangeRequest.objects.none()
    
        return ExchangeRequest.objects.filter(requested_by=client).order_by('-replacement')
    
    def perform_create(self, serializer):
        refund_request = serializer.validated_data.get("refund_request")

        if refund_request.order.client != self.request.user:
            raise PermissionDenied("Cette demande ne vous appartient pas.")

        if refund_request.refund_status != 'APPROVED':
            raise ValidationError("Un échange ne peut être demandé que si le remboursement est approuvé.")

        serializer.save(requested_by=self.request.user)
    


class ExchangeRequestDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ExchangeRequestSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return ExchangeRequest.objects.filter(requested_by=self.request.user)


class NotificationListCreateAPIView(generics.ListCreateAPIView):
    serializer_class = NotificationSerializer
    permission_classes = [IsAuthenticated]
    def get_queryset(self):
        return Notification.objects.filter(user=self.request.user)
    


class NotificationDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = NotificationSerializer
    permission_classes = [IsAuthenticated]


class PromoCodeListCreateAPIView(generics.ListCreateAPIView):
    queryset = PromoCode.objects.all().order_by('code')
    serializer_class = PromoCodeSerializer
    permission_classes = [IsAuthenticated]
    


class PromoCodeDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = PromoCode.objects.all()
    serializer_class = PromoCodeSerializer
    permission_classes = [IsAuthenticated]


class ProductDiscountListCreateAPIView(generics.ListCreateAPIView):
    queryset = ProductDiscount.objects.all().order_by('id')
    serializer_class = ProductDiscountSerializer
    permission_classes = [IsAuthenticated]


class ProductDiscountDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = ProductDiscount.objects.all()
    serializer_class = ProductDiscountSerializer
    permission_classes = [IsAuthenticated]
   





class PaymentLogListCreateAPIView(generics.ListCreateAPIView):
    queryset = PaymentLog.objects.all()
    serializer_class = PaymentLogSerializer
    permission_classes = [IsAuthenticated]
    


class PaymentLogDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = PaymentLog.objects.all()
    serializer_class = PaymentLogSerializer
    permission_classes = [IsAuthenticated]


class TrackingInfoListCreateAPIView(generics.ListCreateAPIView):
    queryset = TrackingInfo.objects.all()
    serializer_class = TrackingInfoSerializer
    permission_classes = [IsAuthenticated]
    


class TrackingInfoDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = TrackingInfo.objects.all()
    serializer_class = TrackingInfoSerializer
    permission_classes = [IsAuthenticated]


class ProofListCreateAPIView(generics.ListCreateAPIView):
    queryset = Proof.objects.all()
    serializer_class = ProofSerializer
    permission_classes = [IsAuthenticated]
   

class ProofDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Proof.objects.all()
    serializer_class = ProofSerializer
    permission_classes = [IsAuthenticated]


class StockAlertListCreateAPIView(generics.ListCreateAPIView):
    queryset = StockAlert.objects.all().order_by('product', 'warehouse')
    serializer_class = StockAlertSerializer
    permission_classes = [IsAuthenticated]
    
    def get_queryset(self):
        user = self.request.user
        qs = StockAlert.objects.all()
        if getattr(user, 'is_agriculteur', False):
            qs = qs.filter(product__owner=user, warehouse__owner=user)
        return qs

    def perform_create(self, serializer):
        product = serializer.validated_data['product']
        warehouse = serializer.validated_data['warehouse']
        user = self.request.user
        if hasattr(user, 'is_agriculteur') and user.is_agriculteur:
            if product.owner != user or warehouse.owner != user:
                raise PermissionDenied("Vous ne pouvez créer une alerte que pour vos propres produits et entrepôts.")
        serializer.save()

class StockAlertDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = StockAlert.objects.all()
    serializer_class = StockAlertSerializer
    permission_classes = [IsAuthenticated]


class LogoutView(APIView):
    permission_classes = [IsAuthenticated]
    serializer_class = LogoutSerializer

    @extend_schema(
        request=LogoutSerializer,
        responses={205: OpenApiResponse(response=LogoutSerializer)}
    )
    def post(self, request):
        try:
            refresh_token = request.data["refresh"]
            token = RefreshToken(refresh_token)
            token.blacklist()
            return Response({"message": "Déconnexion réussie."}, status=status.HTTP_205_RESET_CONTENT)
        except Exception:
            return Response({"error": "Token invalide ou déjà blacklisté."}, status=status.HTTP_400_BAD_REQUEST)


class ProfileView(APIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ProfileSerializer

    @extend_schema(
        responses={200: OpenApiResponse(response=ProfileSerializer)}
    )
    def get(self, request):
        serializer = self.serializer_class(request.user)
        return Response(serializer.data)

    @extend_schema(
        request=ProfileSerializer,
        responses={200: OpenApiResponse(response=ProfileSerializer)}
    )
    def put(self, request):
        serializer = self.serializer_class(request.user, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)


# ----------- Vue de test HTML -----------

def test_accueil(request):
    return render(request, 'accueil.html')


class CartRetrieveAPIView(generics.RetrieveAPIView):
    serializer_class = CartSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_object(self):
        cart, _ = Cart.objects.get_or_create(user=self.request.user)
        return cart

class CartItemAddUpdateAPIView(generics.CreateAPIView):
    serializer_class = CartItemSerializer
    permission_classes = [permissions.IsAuthenticated]

    def create(self, request, *args, **kwargs):
        cart, _ = Cart.objects.get_or_create(user=request.user)
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        product = serializer.validated_data['product']
        quantity = serializer.validated_data['quantity']

        item, created = CartItem.objects.get_or_create(cart=cart, product=product)
        if not created:
            item.quantity += quantity
            item.save()
        else:
            item.quantity = quantity
            item.save()

        # Ici on sérialise manuellement l'objet à retourner
        output_serializer = self.get_serializer(instance=item)
        headers = self.get_success_headers(output_serializer.data)
        return Response(output_serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class CartItemUpdateQuantityAPIView(generics.UpdateAPIView):
    queryset = CartItem.objects.all()
    serializer_class = CartItemSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return CartItem.objects.filter(cart__user=self.request.user)

class CartItemDeleteAPIView(generics.DestroyAPIView):
    queryset = CartItem.objects.all()
    serializer_class = CartItemSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return CartItem.objects.filter(cart__user=self.request.user)
    
class CartItemListAPIView(generics.ListAPIView):
    serializer_class = CartItemSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # Récupérer uniquement les items du panier de l'utilisateur connecté
        return CartItem.objects.filter(cart__user=self.request.user)
    

# 📦 1. Livreur - Liste & Création
class LivreurListCreateAPIView(generics.ListCreateAPIView):
    serializer_class = DeliveryPersonSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        if user.is_superuser:
            return DeliveryPerson.objects.all()
        if getattr(user, 'is_agriculteur', False):
            return DeliveryPerson.objects.filter(agriculteur=user)
        return DeliveryPerson.objects.none()

    def perform_create(self, serializer):
        user = self.request.user
        if user.is_superuser:
            serializer.save()
        elif getattr(user, 'is_agriculteur', False):
            serializer.save(agriculteur=user)
        else:
            raise PermissionDenied("Vous n'avez pas le droit d'ajouter un livreur.")


# 📦 2. Livreur - Détail / Modification / Suppression
class LivreurDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = DeliveryPersonSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        if user.is_superuser:
            return DeliveryPerson.objects.all()
        if getattr(user, 'is_agriculteur', False):
            return DeliveryPerson.objects.filter(agriculteur=user)
        return DeliveryPerson.objects.none()


# 📦 3. Assigner une livraison à un livreur
class DeliveryAssignAPIView(APIView):
    permission_classes = [IsAuthenticated]

    @extend_schema(
        request=DeliveryInputSerializer,
        responses={200: OpenApiResponse(description="Livraison assignée")}
    )
    def post(self, request):
        delivery_id = request.data.get('delivery_id')
        livreur_id = request.data.get('livreur_id')

        try:
            delivery = Delivery.objects.get(id=delivery_id, product__owner=request.user)
        except Delivery.DoesNotExist:
            raise NotFound("Livraison introuvable ou non autorisée.")

        try:
            livreur = DeliveryPerson.objects.get(id=livreur_id, agriculteur=request.user)
        except DeliveryPerson.DoesNotExist:
            raise NotFound("Livreur introuvable ou non autorisé.")

        delivery.deliverer = livreur.user
        delivery.save(update_fields=["deliverer"])

        return Response({'status': 'assigned'})


# 📦 4. ViewSet pour Delivery
class DeliveryViewSet(viewsets.ModelViewSet):
    queryset = Delivery.objects.select_related('order', 'deliverer').all()
    serializer_class = DeliverySerializer
    permission_classes = [IsAdminOrDelivererOrOrderOwner]

    def get_queryset(self):
        user = self.request.user
        if user.is_livreur:  # <-- ajoute ce champ ou groupe selon ton auth
            return Delivery.objects.filter(deliverer=user)
        return super().get_queryset()

    @action(detail=True, methods=['post'])
    @extend_schema(
        responses={200: OpenApiResponse(description="Livraison marquée comme terminée")}
    )
    def mark_finished(self, request, pk=None):
        delivery = self.get_object()
        delivery.delivery_status = Delivery.Status.TERMINEE  # ✅ correction ici
        delivery.save(update_fields=['delivery_status'])
        return Response({'status': delivery.delivery_status})
    

@action(detail=True, methods=['post'], url_path='reassign')
@extend_schema(
    request=inline_serializer(
        name='ReassignDeliveryInput',
        fields={
            'livreur_id': serializers.IntegerField()
        }
    ),
    responses={200: OpenApiResponse(description="Livraison réassignée")}
)
def reassign(self, request, pk=None):
    delivery = self.get_object()
    livreur_id = request.data.get('livreur_id')

    if not livreur_id:
        raise ValidationError({"livreur_id": "Ce champ est requis."})

    try:
        # On vérifie que le livreur appartient bien au même agriculteur ou que l'utilisateur est superuser
        if request.user.is_superuser:
            livreur = DeliveryPerson.objects.get(id=livreur_id)
        else:
            livreur = DeliveryPerson.objects.get(id=livreur_id, agriculteur=request.user)
    except DeliveryPerson.DoesNotExist:
        raise NotFound("Livreur introuvable ou non autorisé.")

    # (Optionnel) Refuser la réassignation si la livraison est terminée
    if delivery.delivery_status == Delivery.Status.TERMINEE:
        raise ValidationError({"detail": "Impossible de réassigner une livraison déjà terminée."})

    delivery.deliverer = livreur.user
    delivery.save(update_fields=["deliverer"])

    return Response({'status': 'réassignée', 'delivery_id': delivery.id})
    



@api_view(['POST'])
@permission_classes([IsAuthenticated])
def create_order_from_cart_view(request):
    try:
        order = create_order_from_cart(request.user)
        return Response(OrderSerializer(order).data, status=status.HTTP_201_CREATED)
    except ValidationError as e:
        return Response({"detail": str(e)}, status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        print("Erreur serveur lors de la création de commande:", e)
        return Response({"detail": "Erreur interne du serveur."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    

class ProductReviewListView(APIView):
    permission_classes = [AllowAny]

    def get(self, request, format=None):
        product_id = request.query_params.get('product')
        if not product_id:
            return Response({"detail": "Paramètre 'product' requis"}, status=400)

        reviews = ProductReview.objects.filter(product_id=product_id)
        serializer = ProductReviewSerializer(reviews, many=True)
        return Response(serializer.data)

class ProductReviewCreateView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        data = request.data.copy()
        try:
            client = Client.objects.get(user=request.user)
        except Client.DoesNotExist:
            return Response({"detail": "Aucun profil client associé à cet utilisateur."}, status=400)

        serializer = ProductReviewSerializer(data=data, context={'request': request})
        if serializer.is_valid():
            serializer.save(client=client)  # Injecte le client côté serveur
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ProductReviewDetailView(RetrieveUpdateDestroyAPIView):
    queryset = ProductReview.objects.all()
    serializer_class = ProductReviewSerializer

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def latest_tracking_position(request, delivery_id):
    tracking = DeliveryTracking.objects.filter(delivery_id=delivery_id).order_by('-timestamp').first()
    if tracking:
        return Response({
            'latitude': tracking.latitude,
            'longitude': tracking.longitude,
        })
    return Response({'detail': 'Aucune position trouvée'}, status=404)