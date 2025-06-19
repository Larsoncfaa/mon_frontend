import uuid
from io import BytesIO
from datetime import timedelta
import re

# Django imports
from django.conf import settings
from django.contrib.auth.models import AbstractUser, Group, Permission
from django.core.exceptions import ValidationError
from django.core.files import File
from django.core.validators import FileExtensionValidator, MinValueValidator, MaxValueValidator
from django.db import models, transaction
from django.db.models import F, Sum, Index, Case, When, IntegerField
from django.utils import timezone
from django.utils.timezone import now
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from django.db.models import Avg



from django.utils.translation import gettext_lazy as _
import qrcode

# Local imports
from .constants import UNIT_CHOICES
from .utils import send_alert, generate_pdf  # suppose generate_pdf exists

def validate_mali_phone(value):
        if not re.match(r'^(2|6|7|9)\d{7}$', value):
            raise ValidationError("Le numéro doit être un numéro malien valide à 8 chiffres (commençant par 2, 6, 7 ou 9).")


# ---------- Utilisateur personnalisé avec audit ----------

class CustomUser(AbstractUser):
    """
    Extension de AbstractUser pour gérer rôles, permissions et audit.
    """
    email = models.EmailField(
        unique=True,
        verbose_name=_("Email")
    )
    phone = models.CharField(
        max_length=8,
        blank=True, null=True,
        verbose_name=_("Téléphone"),
        validators=[validate_mali_phone]
    )
    language = models.CharField(
        max_length=5,
        default='fr',
        verbose_name=_("Langue")
    )
    is_verified = models.BooleanField(
        default=False,
        verbose_name=_("Vérifié")
    )
    is_agriculteur = models.BooleanField(
        default=False,
        verbose_name=_("Agriculteur")
    )
    is_livreur = models.BooleanField(
        default=False,
        verbose_name=_("Livreur")
    )
    is_client = models.BooleanField(
        default=False,
        verbose_name=_("Client")
    )

    REQUIRED_FIELDS = ['email', 'first_name', 'last_name']

    class Meta:
        verbose_name = _("Utilisateur")
        verbose_name_plural = _("Utilisateurs")
        indexes = [
            Index(fields=['email']),
            Index(fields=['username']),
        ]

    

    def save(self, *args, **kwargs):
        self.email = self.email.lower().strip()
        
        # Vérifie qu’un autre utilisateur n’a pas déjà cet email
        if not self.pk and CustomUser.objects.filter(email=self.email).exists():
            raise ValidationError({'email': _("Cet email est déjà utilisé.")})
        
        # Génération d’un username unique si vide
        if not self.username:
            base = f"{self.first_name[0] if self.first_name else 'u'}{self.last_name}".lower()
            base = base or self.email.split('@')[0]
            unique_suffix = uuid.uuid4().hex[:4]
            self.username = f"{base}-{unique_suffix}"
        
        super().save(*args, **kwargs)

    def __str__(self):
        return self.get_full_name() or self.username

class Supplier(models.Model):
    """
    Fournisseur de semences, engrais ou outils.
    """
    ENGRAIS = 'ENGRAIS'
    SEMENCES = 'SEMENCES'
    OUTILS = 'OUTILS'
    TYPE_CHOICES = [
        (ENGRAIS, _('Engrais')),
        (SEMENCES, _('Semences')),
        (OUTILS, _('Outils agricoles')),
    ]

    name = models.CharField(
        max_length=100,
        verbose_name=_("Nom")
    )
    contact = models.CharField(
        max_length=100,
        verbose_name=_("Contact")
    )
    product_type = models.CharField(
        max_length=20,
        choices=TYPE_CHOICES,
        verbose_name=_("Type")
    )
    address = models.TextField(
        verbose_name=_("Adresse")
    )
    date_added = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Date d'ajout")
    )

    class Meta:
        verbose_name = _("Fournisseur")
        verbose_name_plural = _("Fournisseurs")
        indexes = [
            Index(fields=['name']),
            Index(fields=['product_type']),
        ]

    def __str__(self):
        return f"{self.name} – {self.get_product_type_display()}"
    
class UserRole(models.TextChoices):
    AGRICULTEUR = "agriculteur", "Agriculteur"
    CLIENT      = "client",      "Client"
    LIVREUR     = "livreur",     "Livreur"


# ---------- Catégories & Produits ----------

class Category(models.Model):
    """
    Catégories libres saisies par l’utilisateur.
    """
    name = models.CharField(
        max_length=50,
        unique=True,
        verbose_name=_("Catégorie"),
        help_text=_("Saisir ou choisir une catégorie existante")
    )

    class Meta:
        verbose_name = _("Catégorie")
        verbose_name_plural = _("Catégories")
        indexes = [Index(fields=['name'])]

    def __str__(self):
        return self.name


class Product(models.Model):
    """
    Produit avec gestion de stock, image, QR code.
    """
    name = models.CharField(
        max_length=100,
        verbose_name=_("Nom")
    )
    category = models.ForeignKey(
        Category,
        on_delete=models.PROTECT,
        related_name="produits",
        verbose_name=_("Catégorie")
    )
    description = models.TextField(
        blank=True, null=True,
        verbose_name=_("Description")
    )
    image = models.ImageField(
        upload_to='products/',
        blank=True, null=True,
        validators=[FileExtensionValidator(['jpg', 'jpeg', 'png'])],
        verbose_name=_("Image")
    )
   
    unit = models.CharField(
        max_length=5,
        choices=UNIT_CHOICES,
        verbose_name=_("Unité")
    )
    purchase_price = models.DecimalField(
        max_digits=10, decimal_places=2,
        validators=[MinValueValidator(0)],
        verbose_name=_("Prix d'achat"),
        null=False,
        blank=False,
    )
    selling_price = models.DecimalField(
        max_digits=10, decimal_places=2,
        validators=[MinValueValidator(0)],
        verbose_name=_("Prix de vente"),    
        null=False,
        blank=False,
    )
    expiration_date = models.DateField(
        blank=True, null=True,
        verbose_name=_("Date d'expiration")
    )
    qr_code_image = models.ImageField(
        upload_to='qr_codes/',
        blank=True, null=True,
        verbose_name=_("QR Code")
    )

    owner = models.ForeignKey(
    settings.AUTH_USER_MODEL,
    on_delete=models.CASCADE,
    related_name="products",
    verbose_name=_("Propriétaire"),
    null=True,
)

    class Meta:
        verbose_name = _("Produit")
        verbose_name_plural = _("Produits")
        unique_together = ('name', 'category')
        indexes = [
            Index(fields=['name']),
            Index(fields=['category']),
        ]

    @property
    def average_rating(self):
        from api.models import ProductReview  # importe localement pour éviter les boucles
        avg = ProductReview.objects.filter(product=self).aggregate(avg=Avg('rating'))['avg']
        return round(avg, 1) if avg is not None else None

    @property
    def quantity_in_stock(self):
        return self.niveaux_stock.aggregate(total=Sum('quantity'))['total'] or 0

    def clean(self):
        if not self.name:
            raise ValidationError({'name': _("Le nom du produit est obligatoire.")})
        if not self.category:
            raise ValidationError({'category': _("La catégorie est obligatoire.")})
        if self.expiration_date and self.expiration_date < timezone.now().date():
            raise ValidationError({'expiration_date': _("Date d'expiration dépassée.")})

    def save(self, *args, **kwargs):
        self.clean()
        regenerate = not self.pk or not self.qr_code_image
        if not regenerate:
            old = Product.objects.filter(pk=self.pk).values('name', 'selling_price').first()
            if old and (old['name'] != self.name or old['selling_price'] != self.selling_price):
                regenerate = True
        if regenerate:
            qr = qrcode.QRCode(version=1, box_size=10, border=4)
            qr.add_data(f"Produit: {self.name} | Prix: {self.selling_price}")
            qr.make(fit=True)
            img = qr.make_image(fill_color='black', back_color='white')
            buf = BytesIO()
            img.save(buf, format='PNG')
            self.qr_code_image.save(f"qr_{uuid.uuid4().hex}.png", File(buf), save=False)

            
        super().save(*args, **kwargs)
    
    

    
    def delete(self, *args, **kwargs):
        if self.image:
            self.image.delete(save=False)
        super().delete(*args, **kwargs)

    def __str__(self):
        return f"{self.name} ({self.category.name})"
    
class Selection(models.Model):
    product = models.ForeignKey('Product', on_delete=models.CASCADE)  # En supposant que 'Product' est un autre modèle
    image = models.ImageField(upload_to='selections/', null=True, blank=True)
    quantity = models.IntegerField()
    name = models.CharField(max_length=255)
    selling_price = models.DecimalField(max_digits=10, decimal_places=2)  # Représente le prix sous forme de decimal
    description = models.TextField(null=True, blank=True)
    expiration_date = models.DateTimeField(null=True, blank=True)
    category = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)

    

    def __str__(self):
        return f"Selection of {self.product.name} by {self.name}"

# ---------- Fournisseurs & Approvisionnement ----------



# ---------- Entrepôts, Lots & Mouvements de stock ----------

class Warehouse(models.Model):
    """
    Entrepôt physique.
    """
    name = models.CharField(
        max_length=100,
        verbose_name=_("Nom")
    )
    location = models.CharField(
        max_length=200,
        verbose_name=_("Localisation")
    )

    owner = models.ForeignKey(
    settings.AUTH_USER_MODEL,
    on_delete=models.CASCADE,
    related_name="warehouses",
    verbose_name=_("Propriétaire"),
    null=True,    # <— Autorise temporairement les valeurs nulles
    blank=True,
)

    class Meta:
        verbose_name = _("Entrepôt")
        verbose_name_plural = _("Entrepôts")

    def __str__(self):
        return self.name


class Batch(models.Model):
    """
    Lot de production ou numéro de série.
    """
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name="lots",
        verbose_name=_("Produit")
    )
    lot_number = models.CharField(
        max_length=50,
        verbose_name=_("Numéro de lot")
    )
    expiration_date = models.DateField(
        blank=True, null=True,
        verbose_name=_("Date d'expiration")
    )

    class Meta:
        unique_together = ('product', 'lot_number')
        verbose_name = _("Lot")
        verbose_name_plural = _("Lots")

    def __str__(self):
        return f"{self.product.name} – Lot {self.lot_number}"


class StockLevel(models.Model):
    """
    Niveau de stock par entrepôt.
    """
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name="niveaux_stock",
        verbose_name=_("Produit")
    )
    warehouse = models.ForeignKey(
        Warehouse,
        on_delete=models.CASCADE,
        related_name="niveaux_stock",
        verbose_name=_("Entrepôt")
    )
    quantity = models.PositiveIntegerField(
        verbose_name=_("Quantité en stock")
    )

    class Meta:
        verbose_name = _("Niveau de stock")
        verbose_name_plural = _("Niveaux de stock")
        unique_together = ('product', 'warehouse')
        ordering = ['id']

    


    def __str__(self):
        return f"{self.product.name} @ {self.warehouse.name}: {self.quantity}"
    
   


class StockMovement(models.Model):
    """
    Représente un mouvement de stock : entrée, sortie ou ajustement.
    """
    IN = 'IN'
    OUT = 'OUT'
    ADJ = 'ADJ'

    MOVEMENT_CHOICES = [
        (IN, _('Entrée')),
        (OUT, _('Sortie')),
        (ADJ, _('Ajustement')),
    ]

    product = models.ForeignKey(
        'Product',
        on_delete=models.CASCADE,
        related_name="mouvements_stock",
        verbose_name=_("Produit")
    )
    warehouse = models.ForeignKey(
        'Warehouse',
        on_delete=models.CASCADE,
        related_name="mouvements_stock",
        verbose_name=_("Entrepôt")
    )
    batch = models.ForeignKey(
        'Batch',
        null=True, blank=True,
        on_delete=models.SET_NULL,
        related_name="mouvements_stock",
        verbose_name=_("Lot")
    )
    movement_type = models.CharField(
        max_length=3,
        choices=MOVEMENT_CHOICES,
        verbose_name=_("Type de mouvement")
    )
    quantity = models.PositiveIntegerField(
        verbose_name=_("Quantité")
    )
    timestamp = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Date et heure")
    )
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        null=True,
        on_delete=models.SET_NULL,
        verbose_name=_("Utilisateur")
    )
    # Flag pour éviter de réappliquer plusieurs fois
    stock_applied = models.BooleanField(default=False, editable=False)

    is_archived = models.BooleanField(default=False)

    class Meta:
        verbose_name = _("Mouvement de stock")
        verbose_name_plural = _("Mouvements de stock")
        ordering = ['-timestamp']

    def save(self, *args, **kwargs):
        is_new = self.pk is None

        if self.user != self.product.owner:
            raise ValidationError(_("Vous n'êtes pas autorisé à faire cela."))

        with transaction.atomic():
        # Si modification : annuler l'effet du précédent mouvement
            if not is_new:
                old = StockMovement.objects.get(pk=self.pk)
                if old.stock_applied:
                    old_niveau, _ = StockLevel.objects.select_for_update().get_or_create(
                        product=old.product,
                        warehouse=old.warehouse,
                        defaults={'quantity': 0}
                )
                    if old.movement_type == self.OUT:
                        old_delta = -old.quantity
                    elif old.movement_type == self.ADJ:
                        current_quantity = old_niveau.quantity
                        old_delta = old.quantity - current_quantity
                    else:
                        old_delta = old.quantity

                    old_niveau.quantity = F('quantity') + old_delta
                    old_niveau.save()
                    old_niveau.refresh_from_db()

                # réappliquer ensuite
                    self.stock_applied = False

        # Vérification du stock (seulement si nouveau OUT)
            if is_new and self.movement_type == self.OUT:
                lvl = (StockLevel.objects
                    .select_for_update()
                    .filter(product=self.product, warehouse=self.warehouse)
                    .first())
                if not lvl or lvl.quantity < self.quantity:
                    raise ValidationError(_("Stock insuffisant."))

        # Enregistrer le mouvement (nouveau ou modifié)
            super().save(*args, **kwargs)

        # Mise à jour du stock si non encore appliqué
            if not self.stock_applied:
                niveau, _ = StockLevel.objects.select_for_update().get_or_create(
                    product=self.product,
                    warehouse=self.warehouse,
                    defaults={'quantity': 0}
            )

                if self.movement_type == self.OUT:
                    delta = -self.quantity
                elif self.movement_type == self.ADJ:
                    current_quantity = niveau.quantity
                    delta = self.quantity - current_quantity
                else:
                    delta = self.quantity

                new_quantity = niveau.quantity + delta
                if new_quantity < 0:
                        raise ValidationError(_("La quantité résultante en stock ne peut pas être négative."))

                niveau.quantity = F('quantity') + delta
                niveau.save()
                niveau.refresh_from_db()

            # Déclenchement des alertes
                for alert in self.product.alerts.filter(is_active=True, warehouse=self.warehouse):
                    alert.check_stock()

            # Marquer comme appliqué
                self.stock_applied = True
                super().save(update_fields=['stock_applied'])

    def __str__(self):
        return f"{self.get_movement_type_display()} – {self.product.name} ({self.quantity})"

# ---------- Profils clients, Commandes, Factures & Retours ----------

class ClientProfile(models.Model):
    """
    Informations complémentaires pour le client.
    """
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="profil_client",
        verbose_name=_("Utilisateur")
    )
    location = models.CharField(
        max_length=100,
        verbose_name=_("Localisation"),
        blank=True,
        null=True,
    )
    balance = models.DecimalField(
        max_digits=10, decimal_places=2,
        default=0,
        validators=[MinValueValidator(0)],
        verbose_name=_("Solde")
    )

    class Meta:
        verbose_name = _("Profil client")
        verbose_name_plural = _("Profils clients")

    def __str__(self):
        return self.user.username


class Order(models.Model):
    """
    Commande passée par un client.
    """
    PENDING = 'PENDING'
    EN_COURS = 'EN_COURS'
    DELIVERED = 'DELIVERED'
    CANCELLED = 'CANCELLED'
    STATUS_CHOICES = [
        (PENDING, _('En attente')),
        (EN_COURS, _('En cours')),
        (DELIVERED, _('Livrée')),
        (CANCELLED, _('Annulée')),
    ]

    client = models.ForeignKey(
        ClientProfile,
        on_delete=models.CASCADE,
        related_name="commandes",
        verbose_name=_("Client")
    )
    date_ordered = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Date")
    )
    order_status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default=PENDING,
        verbose_name=_("Statut commande")
    )
    total = models.DecimalField(
        max_digits=10, decimal_places=2,
        validators=[MinValueValidator(0)],
        verbose_name=_("Total"),
        default=0,
    )

    class Meta:
        verbose_name = _("Commande")
        verbose_name_plural = _("Commandes")
        ordering = ['client'] 

    def update_total(self):
        total = sum(line.unit_price * line.quantity for line in self.lignes_commandes.all())
        self.total = total
        self.save(update_fields=['total'])

    def update_status_if_paid(self):
        paid = self.payments.filter(payment_status='PAID').aggregate(sum=Sum('amount'))['sum'] or 0
        if paid >= self.total and self.order_status != self.EN_COURS:
            self.order_status = self.EN_COURS
            self.save(update_fields=['order_status'])

    def clean(self):
        if self.pk and not self.lignes_commandes.exists():
            raise ValidationError("Une commande doit contenir au moins une ligne de commande.")

    def save(self, *args, **kwargs):
        self.full_clean()  # Appelle clean() avant de sauvegarder
        super().save(*args, **kwargs)

    def __str__(self):
        return f"Commande #{self.id} – {self.client.user.username}"


class OrderLine(models.Model):
    """
    Ligne de détail pour chaque commande.
    """
    order = models.ForeignKey(
        Order,
        on_delete=models.CASCADE,
        related_name="lignes_commandes",
        verbose_name=_("Commande")
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.PROTECT,
        related_name="lignes_commandes",
        verbose_name=_("Produit")
    )
    quantity = models.PositiveIntegerField(
        verbose_name=_("Quantité")
    )
    unit_price = models.DecimalField(
        max_digits=10, decimal_places=2,
        validators=[MinValueValidator(0)],
        verbose_name=_("Prix unitaire"),
        null=True, blank=True


    )

    class Meta:
        verbose_name = _("Ligne de commande")
        verbose_name_plural = _("Lignes de commande")


    def clean(self):
        # Vérifie le stock disponible pour le produit (et l'entrepôt si besoin)
        stock = self.product.quantity_in_stock  # ou utilise StockLevel si gestion par entrepôt
        if self.quantity > stock:
            raise ValidationError(
                f"Stock insuffisant pour {self.product.name} : {stock} disponible, {self.quantity} demandé."
            )
    
    
    def __str__(self):
        return f"{self.quantity} × {self.product.name}"


class Invoice(models.Model):
    """
    Facture PDF générée pour chaque commande.
    """
    order = models.OneToOneField(
        Order,
        on_delete=models.CASCADE,
        related_name="facture",
        verbose_name=_("Commande")
    )
    pdf = models.FileField(
        upload_to='invoices/',
        verbose_name=_("Fichier PDF")
    )
    issued_at = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Émise le")
    )

    class Meta:
        verbose_name = _("Facture")
        verbose_name_plural = _("Factures")

    def generate_pdf(self):
        self.pdf = generate_pdf(self.order)
        self.save(update_fields=['pdf'])

    def delete(self, *args, **kwargs):
        if self.pdf:
            self.pdf.delete(save=False)
        super().delete(*args, **kwargs)




class ExchangeRequest(models.Model):
    """
    Échange de produit suite à un retour.
    """
   
    replacement = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name="echanges",
        verbose_name=_("Produit de remplacement")
    )
    exchange_status = models.CharField(
        max_length=20,
        choices=[('PENDING', _('En attente')), ('COMPLETED', _('Terminé'))],
        default='PENDING',
        verbose_name=_("Statut échange")
    )
    refund_request = models.OneToOneField(
       'RefundRequest',
        on_delete=models.CASCADE,
        related_name="exchange_request",
        verbose_name=_("Demande de remboursement liée"),    
        null=True,
        blank=True,
    )

    requested_by = models.ForeignKey(
        ClientProfile, on_delete=models.CASCADE,
        related_name="exchange_requests",
        null=True,
        blank=True,
    )

    class Meta:
        verbose_name = _("Demande d'échange")
        verbose_name_plural = _("Demandes d'échange")
        ordering = ['replacement']
        


# ---------- Notifications & Audit ----------

class Notification(models.Model):
    """
    Notification interne (email/SMS ou WebSocket).
    """
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="notifications",
        verbose_name=_("Utilisateur")
    )
    message = models.TextField(
        verbose_name=_("Message")
    )
    link = models.URLField(
        blank=True, null=True,
        verbose_name=_("Lien")
    )
    read = models.BooleanField(
        default=False,
        verbose_name=_("Lu")
    )
    created_at = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Créée le")
    )

    class Meta:
        verbose_name = _("Notification")
        verbose_name_plural = _("Notifications")

    def __str__(self):
        return f"Notif #{self.id} – {'Lu' if self.read else 'Non lu'}"


# ---------- Promotions & Remises ----------

class PromoCode(models.Model):
    """
    Codes promo utilisables sur commandes.
    """
    code = models.CharField(
        max_length=20,
        unique=True,
        verbose_name=_("Code")
    )
    discount_percent = models.DecimalField(
        max_digits=5, decimal_places=2,
        validators=[MinValueValidator(0)],
        verbose_name=_("% de remise")
    )
    valid_from = models.DateTimeField(
        verbose_name=_("Valide à partir de")
    )
    valid_to = models.DateTimeField(
        verbose_name=_("Valide jusqu'à")
    )
    usage_limit = models.PositiveIntegerField(
        null=True, blank=True,
        verbose_name=_("Limite d'utilisation")
    )

    class Meta:
        verbose_name = _("Code promo")
        verbose_name_plural = _("Codes promo")
        ordering = ['code']

    def __str__(self):
        return self.code


class ProductDiscount(models.Model):
    """
    Remise spécifique sur un produit.
    """
    product = models.OneToOneField(
        Product,
        on_delete=models.CASCADE,
        related_name="remise",       # on peut mettre “remise” au singulier
        verbose_name=_("Produit")
    )
    discount_percent = models.DecimalField(
        max_digits=5, decimal_places=2,
        validators=[
            MinValueValidator(0, message=_("Le pourcentage doit être ≥ 0.")),
            MaxValueValidator(100, message=_("Le pourcentage doit être ≤ 100."))
        ],
        
        verbose_name=_("% de remise")
    )

    class Meta:
        verbose_name = _("Remise produit")
        verbose_name_plural = _("Remises produit")

    def __str__(self):
        return f"{self.discount_percent}% sur {self.product.name}"


# ---------- Paiements & Journaux ----------

class PaymentLog(models.Model):
    """
    Historique détaillé des tentatives de paiement.
    """
    order = models.ForeignKey(
        Order,
        on_delete=models.CASCADE,
        related_name="payment_logs",
        verbose_name=_("Commande")
    )
    attempt_time = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Tentative le")
    )
    payment_status = models.CharField(
        max_length=20,
        verbose_name=_("Statut paiement")
    )
    amount = models.DecimalField(
        max_digits=10, decimal_places=2,
        verbose_name=_("Montant")
    )
    info = models.JSONField(
        default=dict, blank=True,
        verbose_name=_("Info")
    )

    class Meta:
        verbose_name = _("Journal de paiement")
        verbose_name_plural = _("Journaux de paiement")

    def __str__(self):
        return f"Log #{self.id} – {self.payment_status}"


class Payment(models.Model):
    """
    Paiement associé à une commande.
    """
    PAYMENT_METHODS = [
        ('CARD', _('Carte bancaire')),
        ('BANK', _('Virement')),
        ('MOBILE', _('Mobile Money')),
        ('PAYPAL', _('PayPal')),
        ('APPLE_PAY', _('Apple Pay')),
        ('GOOGLE_PAY', _('Google Pay')),
        ('BALANCE', _('Solde client')),
    ]
    PENDING = 'PENDING'
    PAID = 'PAID'
    FAILED = 'FAILED'
    STATUS_CHOICES = [
        (PENDING, _('En attente')),
        (PAID, _('Payé')),
        (FAILED, _('Échoué')),
    ]

    order = models.ForeignKey(
        Order,
        on_delete=models.CASCADE,
        related_name="payments",
        verbose_name=_("Commande")
    )
    method = models.CharField(
        max_length=20,
        choices=PAYMENT_METHODS,
        verbose_name=_("Moyen de paiement")
    )
    amount = models.DecimalField(
        max_digits=10, decimal_places=2,
        validators=[MinValueValidator(0)],
        verbose_name=_("Montant")
    )
    payment_status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default=PENDING,
        verbose_name=_("Statut paiement")
    )
    paid_at = models.DateTimeField(
        null=True, blank=True,
        verbose_name=_("Payé le")
    )

    class Meta:
        verbose_name = _("Paiement")
        verbose_name_plural = _("Paiements")

    def decrement_stock(self):
        """
        Décrémente le stock des produits de la commande.
        Si le stock est insuffisant, lève une ValidationError.
        """
        if self.payment_status != self.PAID:
            raise ValidationError("Le paiement doit être marqué comme payé pour déduire le stock.")
        
        # Vérification du stock pour chaque ligne de commande
        with transaction.atomic():
            order_lines = self.order.lignes_commandes.all()
            for line in order_lines:
                product = line.product
                quantity_needed = line.quantity

            stock_levels = StockLevel.objects.filter(
                product=product,
                product__owner=product.owner
            ).order_by('id')

            quantity_remaining = quantity_needed

            for stock in stock_levels:
                if quantity_remaining <= 0:
                    break
                if stock.quantity == 0:
                    continue
                to_deduct = min(stock.quantity, quantity_remaining)
                stock.quantity -= to_deduct
                stock.save(update_fields=['quantity'])
                quantity_remaining -= to_deduct

            if quantity_remaining > 0:
                raise ValidationError(
                    f"Stock insuffisant pour {product.name}. Quantité demandée : {quantity_needed}, disponible : {quantity_needed - quantity_remaining}"
                )
    
    def clean(self):
        # Total déjà payé pour cette commande (hors ce paiement s'il existe déjà)
        total_paid = self.order.payments.exclude(pk=self.pk).filter(payment_status=self.PAID).aggregate(sum=Sum('amount'))['sum'] or 0
        reste = self.order.total - total_paid
        if self.amount > reste:
            raise ValidationError("Le montant du paiement dépasse le total dû pour cette commande.")

    def save(self, *args, **kwargs):
        self.full_clean()
        with transaction.atomic():
            is_new = self.pk is None
            super().save(*args, **kwargs)
            PaymentLog.objects.create(
                order=self.order,
                payment_status=self.payment_status,
                amount=self.amount,
                info={'new': is_new}
        )
            if self.payment_status == self.PAID and not self.paid_at:
                self.paid_at = timezone.now()
                super().save(update_fields=['paid_at'])
                self.order.update_status_if_paid()
            
            # **Décrémenter le stock ici seulement à la confirmation du paiement**
                self.decrement_stock()

    def __str__(self):
        return f"Paiement #{self.id} – {self.get_payment_status_display()}"


# ---------- Livraisons & Suivi ----------

class Delivery(models.Model):
    """
    Suivi des livraisons et interventions.
    """
    class Type(models.TextChoices):
        LIVRAISON = 'LIVRAISON', _('Problème de livraison')
        STOCK = 'STOCK', _('Intervention stock')
        REMBOURSEMENT = 'REMBOURSEMENT', _('Suivi remboursement')
        AUTRE = 'AUTRE', _('Autre')

    class Status(models.TextChoices):
        EN_ATTENTE = 'EN_ATTENTE', _('En attente')
        EN_COURS = 'EN_COURS', _('En cours')
        TERMINEE = 'TERMINEE', _('Terminée')

    deliverer = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        related_name="deliveries",
        verbose_name=_("Livreur")
    )
    order = models.ForeignKey(
        Order,
        on_delete=models.SET_NULL,
        null=True, blank=True,
        related_name="deliveries",
        verbose_name=_("Commande")
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.SET_NULL,
        null=True, blank=True,
        related_name="deliveries",
        verbose_name=_("Produit")
    )
    type = models.CharField(
        max_length=20,
        choices=Type.choices,
        default=Type.AUTRE,
        verbose_name=_("Type")

    )
    delivery_status = models.CharField(
        max_length=20,
        choices=Status.choices,
        default=Status.EN_ATTENTE,
        verbose_name=_("Statut livraison")
    )
    description = models.TextField(
        verbose_name=_("Description")
    )
    created_at = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Créée le")
    )
    updated_at = models.DateTimeField(
        auto_now=True,
        verbose_name=_("Mis à jour le")
    )

    latitude = models.FloatField(
        null=True,
        blank=True,
        verbose_name=_("Latitude")
    )
    longitude = models.FloatField(
        null=True,
        blank=True,
        verbose_name=_("Longitude")
    )

    class Meta:
        verbose_name = _("Livraison")
        verbose_name_plural = _("Livraisons")

    def __str__(self):
        return f"{self.get_type_display()} – {self.get_delivery_status_display()}"


class TrackingInfo(models.Model):
    """
    Historique GPS/statut de chaque livraison.
    """
    delivery = models.ForeignKey(
        Delivery,
        on_delete=models.CASCADE,
        related_name="tracking_infos",
        verbose_name=_("Livraison")
    )
    tracking_status = models.CharField(
        max_length=50,
        verbose_name=_("Statut des suivis")
    )
    location = models.CharField(
        max_length=200,
        verbose_name=_("Localisation")
    )
    timestamp = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Horodatage")
    )

    class Meta:
        verbose_name = _("Info de suivi")
        verbose_name_plural = _("Infos de suivi")

    def __str__(self):
        return f"{self.tracking_status} @ {self.location}"


class Proof(models.Model):
    """
    Preuve de livraison (photo, signature).
    """
    delivery = models.ForeignKey(
        Delivery,
        on_delete=models.CASCADE,
        related_name="proofs",
        verbose_name=_("Livraison")
    )
    image = models.ImageField(
        upload_to='delivery_proofs/',
        verbose_name=_("Image")
    )
    uploaded_at = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Uploadé le")
    )

    class Meta:
        verbose_name = _("Preuve de livraison")
        verbose_name_plural = _("Preuves de livraison")

    def delete(self, *args, **kwargs):
        if self.image:
            self.image.delete(save=False)
        super().delete(*args, **kwargs)
        # Suppression de l'image du système de fichiers
    
       

    def __str__(self):
        return f"Preuve #{self.id}"


# ---------- Alertes, Avis, Remboursements & Fidélité ----------

class StockAlert(models.Model):
    """
    Alerte de stock faible.
    """
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name="alerts",
        verbose_name=_("Produit")
    )
   
    warehouse = models.ForeignKey(
       Warehouse,
       null=True, blank=True,
       on_delete=models.CASCADE,
      related_name="alerts",
       verbose_name=_("Entrepôt")
               )
    threshold = models.PositiveIntegerField(verbose_name=_("Seuil"))
    is_active = models.BooleanField(default=True, verbose_name=_("Active"))

    class Meta:
        verbose_name = _("Alerte de stock")
        verbose_name_plural = _("Alertes de stock")
        ordering = ['product', 'warehouse']


    def check_stock(self):
        try:
            if self.warehouse:
                niveau = StockLevel.objects.get(product=self.product, warehouse=self.warehouse)
                quantity = niveau.quantity
            else:
            # Alerte globale : total sur tous les entrepôts
                quantity = StockLevel.objects.filter(product=self.product).aggregate(q=Sum('quantity'))['q'] or 0
        except StockLevel.DoesNotExist:
            return

        if quantity <= self.threshold and self.is_active:
            message = (
                f"Stock faible pour {self.product.name}"
                + (f" dans {self.warehouse.name}" if self.warehouse else " (tous entrepôts)")
                + f": {quantity} unités restantes."
        )

        owner = self.product.owner
        send_alert(owner, message)
        Notification.objects.create(
            user=owner,
            message=message,
            link=f"/products/{self.product.id}/",
            read=False
        )

        # Optionnel : historiser l'envoi
        self.last_triggered_at = now()
        self.save(update_fields=['last_triggered_at'])

    def __str__(self):
        return f"Alerte {self.product.name} <= {self.threshold}"

class ProductReview(models.Model):
    """
    Avis laissé par un client sur un produit.
    """
    RATING_CHOICES = [(i, '★'*i + '☆'*(5-i)) for i in range(1,6)]

    client = models.ForeignKey(
        ClientProfile,
        on_delete=models.CASCADE,
        related_name="reviews",
        verbose_name=_("Client")
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name="reviews",
        verbose_name=_("Produit")
    )
    rating = models.PositiveSmallIntegerField(
        choices=RATING_CHOICES,
        verbose_name=_("Note")
    )
    comment = models.TextField(
        blank=True,
        verbose_name=_("Commentaire")
    )
    created_at = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Créé le")
    )
    verified_purchase = models.BooleanField(
        default=False,
        verbose_name=_("Achat vérifié"),
        help_text=_("Indique si l'achat du produit a été vérifié.")
    )

    class Meta:
        verbose_name = _("Avis produit")
        verbose_name_plural = _("Avis produits")
        unique_together = ('client', 'product')

    def __str__(self):
        return f"{self.rating}/5 – {self.product.name}"



class RefundRequest(models.Model):
    """
    Demande de remboursement.
    """
    order = models.ForeignKey(
        Order,
        on_delete=models.CASCADE,
        related_name="refunds",
        verbose_name=_("Commande")
    )
    reason = models.TextField(
        verbose_name=_("Motif")
    )
    evidence = models.FileField(
        upload_to='refunds/',
        validators=[FileExtensionValidator(['pdf','jpg','png'])],
        verbose_name=_("Pièce justificative")
    )
    refund_status = models.CharField(
        max_length=20,
        choices=[
            ('PENDING', _('En attente')),
            ('APPROVED', _('Approuvé')),
            ('REJECTED', _('Rejeté'))
        ],
        default='PENDING',
        verbose_name=_("Statut remboursement")
    )
    requested_at = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_("Demandé le")
    )
    processed_at = models.DateTimeField(
        null=True, blank=True,
        verbose_name=_("Traité le")
    )

    class Meta:
        verbose_name = _("Demande de remboursement")
        verbose_name_plural = _("Demandes de remboursement")

    @property
    def is_eligible(self):
        return (
            self.order.status == Order.DELIVERED and
            (timezone.now() - self.order.date_ordered) <= timedelta(days=14)
        )
    def delete(self, *args, **kwargs):
        if self.evidence:
            self.evidence.delete(save=False)
        super().delete(*args, **kwargs)
        # Delete the associated evidence file if it exists
        
    def __str__(self):
        return f"Remb #{self.id} – {self.get_status_display()}"


class LoyaltyProgram(models.Model):
    """
    Programme de fidélité client.
    """
    client = models.OneToOneField(
        ClientProfile,
        on_delete=models.CASCADE,
        related_name="loyalty",
        verbose_name=_("Client")
    )
    points = models.PositiveIntegerField(
        default=0,
        verbose_name=_("Points")
    )
    last_updated = models.DateTimeField(
        auto_now=True,
        verbose_name=_("Mis à jour le")
    )
    transactions = models.JSONField(
        default=list, blank=True,
        verbose_name=_("Transactions")
    )

    class Meta:
        verbose_name = _("Programme de fidélité")
        verbose_name_plural = _("Programmes de fidélité")

    def add_points(self, order):
        earned = int(order.total // 10)
        LoyaltyProgram.objects.filter(pk=self.pk).update(points=F('points') + earned)
        self.refresh_from_db()
        self.transactions.append({
            'date': timezone.now().isoformat(),
            'order': order.id,
            'points': earned
        })
        self.save(update_fields=['transactions'])
        return earned

    def __str__(self):
        return f"{self.client.user.username} – {self.points} pts"

    
    def use_points(self, points, reason="Utilisation", order=None):
        if self.points < points:
            raise ValidationError("Pas assez de points.")
        LoyaltyProgram.objects.filter(pk=self.pk).update(points=F('points') - points)
        self.refresh_from_db()
        self.transactions.append({
        'date': timezone.now().isoformat(),
        'order': order.id if order else None,
        'points': -points,
        'reason': reason
    })
        self.save(update_fields=['transactions'])
        return points
    

class Cart(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="panier",
        verbose_name="Utilisateur"
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def total(self):
        return sum(item.total_price() for item in self.items.all())

    def __str__(self):
        return f"Panier de {self.user.username}"
    class Meta:
        verbose_name = "Panier"
        verbose_name_plural = "Paniers"
        ordering = ['-updated_at']  # Par exemple, du plus récent au plus ancien

class CartItem(models.Model):
    cart = models.ForeignKey(
        Cart,
        on_delete=models.CASCADE,
        related_name="items"
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE
    )
    quantity = models.PositiveIntegerField(default=1)

    class Meta:
        unique_together = ('cart', 'product')
        verbose_name = "Ligne de panier"
        verbose_name_plural = "Lignes de panier"

    def total_price(self):
        return self.product.selling_price * self.quantity

    def __str__(self):
        return f"{self.quantity} x {self.product.name}"
    

class DeliveryPerson(models.Model):
        user = models.OneToOneField(
            settings.AUTH_USER_MODEL,
            on_delete=models.CASCADE,
            related_name="livreur_profile",
            verbose_name=_("Compte livreur")
    )
        agriculteur = models.ForeignKey(
            settings.AUTH_USER_MODEL,
            on_delete=models.SET_NULL,
            null=True, blank=True,
            related_name="mes_livreurs",
            limit_choices_to={'is_agriculteur': True},
            verbose_name=_("Agriculteur")
    )
        phone = models.CharField(max_length=20, blank=True, verbose_name=_("Téléphone"))

        class Meta:
            verbose_name = _("Livreur")
            verbose_name_plural = _("Livreurs")

        def __str__(self):
            return self.user.get_full_name() or self.user.username


class DeliveryTracking(models.Model):
    delivery = models.ForeignKey(Delivery, on_delete=models.CASCADE)
    latitude = models.FloatField()
    longitude = models.FloatField()
    timestamp = models.DateTimeField(auto_now_add=True)

# views.py
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