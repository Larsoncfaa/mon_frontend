# filters.py

from django_filters import rest_framework as filters
import django_filters
from .models import StockMovement
from .models import Invoice

class StockMovementFilter(filters.FilterSet):
    product = django_filters.CharFilter(field_name='product__name', lookup_expr='icontains')
    warehouse = django_filters.CharFilter(field_name='warehouse__name', lookup_expr='icontains')
    movement_type = django_filters.CharFilter(field_name='movement_type')
    user = django_filters.CharFilter(field_name='user__username', lookup_expr='icontains')
    class Meta:
        model = StockMovement
        fields = []

class InvoiceFilter(django_filters.FilterSet):
    class Meta:
        model = Invoice
        fields = ['order']