# api/urls.py

from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

from api.models import latest_tracking_position

from .views import (
    # Auth
    CartItemListAPIView, LivreurDetailAPIView, LivreurListCreateAPIView, LoyaltyHistoryView, LoyaltyUsePointsView, ProductRetrieveUpdateDestroyAPIView, ProductReviewDetailView, ProductReviewListView, ProfileView, PublicProductListAPIView, RegistrationAPI, LoginAPI, LogoutView,

    # Produits
    ProductListCreateAPIView, SelectionViewSet, StockOverviewAPIView,

    # Fournisseurs
    SupplierListCreateAPIView, SupplierDetailAPIView,

    # Commandes & lignes de commande
    OrderViewSet, OrderLineListCreateAPIView, OrderLineDetailAPIView,

    # Clients
    ClientListCreateAPIView, ClientDetailAPIView,

    # Catégories
    CategoryListCreateAPIView, CategoryDetailAPIView,

    # Reviews & Refunds
    ProductReviewCreateView,  # création
    # si tu veux lecture/modif, ajoute ReviewList/ReviewDetail dans views

    RefundRequestListCreateAPIView,  # création

    # Échanges
    # si tu as ajouté ExchangeRequestListCreateAPIView, ExchangeRequestDetailAPIView
    ExchangeRequestListCreateAPIView, ExchangeRequestDetailAPIView,

    # Factures
    InvoiceListCreateAPIView, InvoiceDetailAPIView,

    # Inventaire
    WarehouseListCreateAPIView, WarehouseDetailAPIView,
    BatchListCreateAPIView,     BatchDetailAPIView,

    StockMovementListCreateAPIView, StockMovementDetailAPIView,
    StockStatsAPIView,

    # Notifications & promotions
    NotificationListCreateAPIView, NotificationDetailAPIView,
    PromoCodeListCreateAPIView,     PromoCodeDetailAPIView,
    ProductDiscountListCreateAPIView, ProductDiscountDetailAPIView,

    # Paiements & logs
    PaymentCreateView,
    PaymentLogListCreateAPIView,    PaymentLogDetailAPIView,

    # Suivi livraison
    TrackingInfoListCreateAPIView,  TrackingInfoDetailAPIView,
    ProofListCreateAPIView,         ProofDetailAPIView,

    # Alertes de stock
    StockAlertListCreateAPIView,    StockAlertDetailAPIView,

    # Programme fidélité
    LoyaltyProgramDetailView, LoyaltyProgramListCreateAPIView,

    # Dashboard & IA globale
    DashboardView, 

    

    # Livraisons CRUD + actions
    DeliveryViewSet, 
    DeliveryAssignAPIView,

    # panier
    CartRetrieveAPIView,
    CartItemAddUpdateAPIView,
    CartItemUpdateQuantityAPIView,
    CartItemDeleteAPIView, check_product_duplicate,
    
)

# --- router pour les viewsets Orders et Deliveries ---
router = DefaultRouter()
router.register(r'orders', OrderViewSet, basename='order')
router.register(r'deliveries', DeliveryViewSet, basename='delivery')
router.register(r'selections', SelectionViewSet, basename='selection')




# --- Swagger / ReDoc schema setup ---
schema_view = get_schema_view(
    openapi.Info(
        title="API Gestion Agricole",
        default_version='v1',
        description="Documentation de l’API Gestion Agricole",
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)


urlpatterns = [
    # --- Authentification ---
    path('v1/auth/register/', RegistrationAPI.as_view(), name='v1-auth-register'),
    path('v1/auth/login/',    LoginAPI.as_view(),    name='v1-auth-login'),
    path('v1/auth/logout/',   LogoutView.as_view(),   name='v1-auth-logout'),
    path('v1/profile/', ProfileView.as_view(), name='v1-profile'),
    # --- Produits ---
    path('v1/products/', ProductListCreateAPIView.as_view(), name='v1-product-list-create'),
    path('v1/products/<int:pk>/', ProductRetrieveUpdateDestroyAPIView.as_view(), name='v1-product-detail'),
    path('v1/public-products/', PublicProductListAPIView.as_view(), name='v1-public-product-list'),
    
    # --- Fournisseurs ---
    path('v1/suppliers/',       SupplierListCreateAPIView.as_view(), name='v1-supplier-list'),
    path('v1/suppliers/<int:pk>/', SupplierDetailAPIView.as_view(),     name='v1-supplier-detail'),

    # --- Commandes & lignes de commande ---
    path('v1/order-lines/',      OrderLineListCreateAPIView.as_view(), name='v1-orderline-list'),
    path('v1/order-lines/<int:pk>/', OrderLineDetailAPIView.as_view(),  name='v1-orderline-detail'),
    path('v1/orders/create-from-cart/', OrderViewSet.as_view({'post': 'create_from_cart'})),

    # --- Clients ---
    path('v1/clients/',      ClientListCreateAPIView.as_view(),  name='v1-client-list'),
    path('v1/clients/<int:pk>/', ClientDetailAPIView.as_view(),  name='v1-client-detail'),


    # --- Catégories ---
    path('v1/categories/',      CategoryListCreateAPIView.as_view(), name='v1-category-list'),
    path('v1/categories/<int:pk>/', CategoryDetailAPIView.as_view(), name='v1-category-detail'),

    # --- Avis produits & échanges & remboursements ---
    path('v1/reviews/',         ProductReviewCreateView.as_view(),   name='v1-review-create'),
    path('v1/reviews/list/', ProductReviewListView.as_view(), name='v1-review-list'),
    path('v1/reviews/<int:pk>/', ProductReviewDetailView.as_view(), name='v1-review-detail'),
    path('v1/exchanges/',       ExchangeRequestListCreateAPIView.as_view(), name='v1-exchange-list'),
    path('v1/exchanges/<int:pk>/', ExchangeRequestDetailAPIView.as_view(),  name='v1-exchange-detail'),
    path('v1/refunds/',         RefundRequestListCreateAPIView.as_view(),    name='v1-refund-create'),

    # --- Factures ---
    path('v1/invoices/',        InvoiceListCreateAPIView.as_view(),  name='v1-invoice-list'),
    path('v1/invoices/<int:pk>/', InvoiceDetailAPIView.as_view(),    name='v1-invoice-detail'),

    # --- Inventaire ---
    path('v1/warehouses/',      WarehouseListCreateAPIView.as_view(),   name='v1-warehouse-list'),
    path('v1/warehouses/<int:pk>/', WarehouseDetailAPIView.as_view(),  name='v1-warehouse-detail'),
    path('v1/batches/',         BatchListCreateAPIView.as_view(),       name='v1-batch-list'),
    path('v1/batches/<int:pk>/', BatchDetailAPIView.as_view(),       name='v1-batch-detail'),
    path('v1/stock-movements/', StockMovementListCreateAPIView.as_view(), name='v1-stockmovement-list'),
    path('v1/stock-movements/<int:pk>/', StockMovementDetailAPIView.as_view(), name='v1-stockmovement-detail'),
    path('v1/stats/overview/', StockOverviewAPIView.as_view(), name='stock-overview'),
    path('v1/stats/', StockStatsAPIView.as_view(), name='stock-stats'),

    # --- Notifications & promotions ---
    path('v1/notifications/',   NotificationListCreateAPIView.as_view(), name='v1-notification-list'),
    path('v1/notifications/<int:pk>/', NotificationDetailAPIView.as_view(), name='v1-notification-detail'),
    path('v1/promocodes/',      PromoCodeListCreateAPIView.as_view(),   name='v1-promocode-list'),
    path('v1/promocodes/<int:pk>/', PromoCodeDetailAPIView.as_view(),   name='v1-promocode-detail'),
    path('v1/discounts/',       ProductDiscountListCreateAPIView.as_view(), name='v1-discount-list'),
    path('v1/discounts/<int:pk>/', ProductDiscountDetailAPIView.as_view(), name='v1-discount-detail'),

    # --- Paiements & logs ---
    path('v1/payments/',        PaymentCreateView.as_view(),            name='v1-payment-create'),
    path('v1/payment-logs/',    PaymentLogListCreateAPIView.as_view(),   name='v1-paymentlog-list'),
    path('v1/payment-logs/<int:pk>/', PaymentLogDetailAPIView.as_view(),   name='v1-paymentlog-detail'),

    # --- Suivi livraison ---
    path('v1/tracking-info/',   TrackingInfoListCreateAPIView.as_view(), name='v1-tracking-list'),
    path('tracking/<int:delivery_id>/latest/', latest_tracking_position, name='latest-tracking'),
    path('v1/tracking-info/<int:pk>/', TrackingInfoDetailAPIView.as_view(), name='v1-tracking-detail'),
    path('v1/proofs/',          ProofListCreateAPIView.as_view(),       name='v1-proof-list'),
    path('v1/proofs/<int:pk>/', ProofDetailAPIView.as_view(),       name='v1-proof-detail'),

    # --- Alertes de stock ---
    path('v1/stock-alerts/',    StockAlertListCreateAPIView.as_view(),   name='v1-stockalert-list'),
    path('v1/stock-alerts/<int:pk>/', StockAlertDetailAPIView.as_view(), name='v1-stockalert-detail'),
    path('v1/stock-stats/', StockStatsAPIView.as_view(), name='v1-stock-stats'),
    # --- Fidélité ---
    path('v1/loyalty/',         LoyaltyProgramDetailView.as_view(),      name='v1-loyalty-detail'),
    path('v1/loyalty-programs/', LoyaltyProgramListCreateAPIView.as_view(), name='v1-loyaltyprogram-list'),
    path('v1/loyalty/use/', LoyaltyUsePointsView.as_view(), name='v1-loyalty-use'),
    path('v1/loyalty/history/', LoyaltyHistoryView.as_view(), name='v1-loyalty-history'),
    # --- Dashboard & IA globale ---
    path('v1/dashboard/',       DashboardView.as_view(),                name='v1-dashboard'),
   

    path('v1/products/<int:pk>/', ProductRetrieveUpdateDestroyAPIView.as_view(), name='v1-product-detail'),
    path('v1/product/check-product-duplicate/', check_product_duplicate, name='check_product_duplicate'),

    # --- Panier ---
    path('v1/cart/', CartRetrieveAPIView.as_view(), name='cart-detail'),
    path('v1/cart/items/', CartItemListAPIView.as_view(), name='cartitem-list'),
    path('v1/cart/items/add/', CartItemAddUpdateAPIView.as_view(), name='cartitem-add'),
    path('v1/cart/items/<int:pk>/update/', CartItemUpdateQuantityAPIView.as_view(), name='cartitem-update'),
    path('v1/cart/items/<int:pk>/delete/', CartItemDeleteAPIView.as_view(), name='cartitem-delete'),

    #livraisons CRUD + actions
    path('v1/livreurs/', LivreurListCreateAPIView.as_view(), name='v1-livreur-list'),
    path('v1/livreurs/<int:pk>/', LivreurDetailAPIView.as_view(), name='v1-livreur-detail'),
    path('v1/deliveries/assign/', DeliveryAssignAPIView.as_view(), name='v1-delivery-assign'),

    # --- Inclusion des routers pour Orders & Deliveries CRUD + actions ---
    path('v1/', include(router.urls)),
    

    # --- Documentation Swagger et ReDoc ---
    path('swagger<format>.json', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    path('swagger/',               schema_view.with_ui('swagger',   cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/',                 schema_view.with_ui('redoc',     cache_timeout=0), name='schema-redoc'),
]
