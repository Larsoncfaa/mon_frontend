# gestionAgri/signals.py

import logging
from datetime import timedelta
from django.db.models import F, Sum, Q
from asgiref.sync import async_to_sync
from channels.layers import get_channel_layer
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils import timezone
from django.db import transaction

from .models import (
    Product, Order, LoyaltyProgram, ProductReview,
    Payment, Delivery, CustomUser, RefundRequest,
    ExchangeRequest, StockLevel, StockMovement, StockAlert,
    ClientProfile
)
from .utils import send_alert, send_sms

logger = logging.getLogger(__name__)

# Utils

def notify_admins_via_sms(message: str):
    admins = CustomUser.objects.filter(is_staff=True, is_active=True)
    send_alert(recipient=admins, message=message)
    for admin in admins:
        if hasattr(admin, 'phone_number') and admin.phone_number:
            try:
                send_sms(admin.phone_number, message)
            except Exception as e:
                logger.warning(f"Erreur SMS admin {admin.id}: {e}")

# 2) Création automatique de la livraison
@receiver(post_save, sender=Order)
def create_delivery_for_new_order(sender, instance, created, **kwargs):
    if created and not Delivery.objects.filter(order=instance).exists():
        Delivery.objects.create(order=instance)

# 3) Attribution de points fidélité à la livraison
@receiver(post_save, sender=Order)
def award_loyalty_points_on_delivery(sender, instance, **kwargs):
    if instance.order_status == Order.DELIVERED:
        loyalty, _ = LoyaltyProgram.objects.get_or_create(client=instance.client)
        if isinstance(loyalty.transactions, list) and not any(txn.get('order') == instance.id for txn in loyalty.transactions):
            points = loyalty.add_points(instance)
            logger.debug(f"Ajout de {points} pts fidélité pour commande #{instance.id}")

# 4) Notification sur nouvel avis produit + SMS admin
@receiver(post_save, sender=ProductReview)
def notify_on_product_review(sender, instance, created, **kwargs):
    if created:
        message = f"Nouvel avis sur « {instance.product.name} » : {instance.rating}/5"
        notify_admins_via_sms(message)

# 5) Mise à jour du statut de commande sur paiement
@receiver(post_save, sender=Payment)
def update_order_on_payment(sender, instance, **kwargs):
    if instance.payment_status == Payment.PAID:
        try:
            instance.order.update_status_if_paid()
        except Exception as e:
            logger.error(f"Erreur update_status_if_paid pour commande #{instance.order.id}: {e}")

# 6) Alerte et relance sur Demande de remboursement + SMS admin
@receiver(post_save, sender=RefundRequest)
def notify_on_refund_request(sender, instance, created, **kwargs):
    if created:
        message = f"Nouvelle demande de remboursement pour commande #{instance.order.id}"
        notify_admins_via_sms(message)

# 7) Création d'un échange de produit + SMS client
@receiver(post_save, sender=ExchangeRequest)
def notify_on_exchange_request(sender, instance, created, **kwargs):
    if created:
        client_user = instance.return_request.order_line.order.client.user
        message = f"Votre demande d'échange pour commande #{instance.return_request.order_line.order.id} est enregistrée"
        send_alert(recipient=client_user, message=message)
        if hasattr(client_user, 'phone_number') and client_user.phone_number:
            try:
                send_sms(client_user.phone_number, message)
            except Exception as e:
                logger.warning(f"Erreur SMS client {client_user.id}: {e}")

# 8) Mise à jour automatique du niveau de stock et déclenchement des alertes
@receiver(post_save, sender=StockMovement)
def apply_stock_movement_and_alerts(sender, instance, created, **kwargs):
    if not created:
        return

    with transaction.atomic():
        # 8a) Mise à jour ou création du StockLevel
        lvl, _ = StockLevel.objects.get_or_create(
            product=instance.product,
            warehouse=instance.warehouse,
            defaults={'quantity': 0}
        )
        delta = instance.quantity if instance.movement_type in (StockMovement.IN, StockMovement.ADJ) else -instance.quantity
        lvl.quantity = F('quantity') + delta
        lvl.save()
        lvl.refresh_from_db()

        # 8b) Déclenchement des alertes
        alerts = StockAlert.objects.filter(
            product=instance.product,
            warehouse=instance.warehouse,
            is_active=True
        )
        for alert in alerts:
            alert.check_stock()

# 9) Gestion des signaux côté Delivery (WebSocket + SMS client)
@receiver(post_save, sender=Delivery)
def notify_delivery_status_change(sender, instance, **kwargs):
    channel_layer = get_channel_layer()
    async_to_sync(channel_layer.group_send)(
        f"user_{instance.order.client.user.id}_deliveries",
        {
            'type': 'delivery_update',
            'data': {
                'order_id': instance.order.id,
                'status': instance.delivery_status,
                'updated_at': timezone.now().isoformat()
            }
        }
    )
    client_user = instance.order.client.user
    message = f"Votre livraison pour la commande #{instance.order.id} est maintenant : {instance.delivery_status}"
    if hasattr(client_user, 'phone_number') and client_user.phone_number:
        try:
            send_sms(client_user.phone_number, message)
        except Exception as e:
            logger.warning(f"Erreur SMS client {client_user.id}: {e}")

# 10) Création de profil client avec SMS de bienvenue
@receiver(post_save, sender=CustomUser)
def create_client_profile(sender, instance, created, **kwargs):
    if created and instance.is_client:
        ClientProfile.objects.get_or_create(user=instance)
        if hasattr(instance, 'phone_number') and instance.phone_number:
            try:
                send_sms(instance.phone_number, "Bienvenue sur la plateforme !")
            except Exception as e:
                logger.warning(f"Erreur SMS bienvenue {instance.id}: {e}")

# 11) Ajustement de stock sur changement de statut de commande
@receiver(post_save, sender=Order)
def adjust_stock_on_order(sender, instance, created, **kwargs):
    if instance.order_status in [Order.EN_COURS, Order.DELIVERED] and not instance.stock_adjusted:
        for line in instance.lignes_commandes.all():
            stock_level, _ = StockLevel.objects.get_or_create(
                product=line.product,
                warehouse=line.product.default_warehouse
            )
            StockMovement.objects.create(
                product=line.product,
                warehouse=stock_level.warehouse,
                movement_type=StockMovement.OUT,
                quantity=line.quantity,
                user=instance.client.user
            )
        instance.stock_adjusted = True
        instance.save(update_fields=['stock_adjusted'])

@receiver(post_save, sender=Payment)
def mark_order_as_paid(sender, instance, **kwargs):
    if instance.payment_status == 'PAID':
        order = instance.order
        # S'il y a au moins un paiement payé et que toutes les conditions sont réunies
        if order.order_status != 'DELIVERED':
            order.order_status = 'DELIVERED'
            order.save()

