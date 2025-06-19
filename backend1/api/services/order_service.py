from django.core.exceptions import ValidationError
from django.db import transaction

from api.models import Cart, Order, OrderLine, StockLevel, Warehouse

def create_order_from_cart(user):
    try:
        cart = user.panier
    except Cart.DoesNotExist:
        raise ValidationError("Le panier est introuvable.")

    if not cart.items.exists():
        raise ValidationError("Le panier est vide.")

    with transaction.atomic():
        order = Order.objects.create(client=user.profil_client)

        for item in cart.items.all():
            product = item.product
            quantity_needed = item.quantity

            # 1. Trouver les stocks disponibles pour ce produit chez l'agriculteur
            stock_levels = StockLevel.objects.filter(
                product=product,
                product__owner=product.owner  # Optionnel si filtré via owner
            ).order_by('id')  # Pour déduire FIFO

            quantity_remaining = quantity_needed

             # ----------- SUPPRESSION DE LA DECREMENTATION DU STOCK -----------
            # for stock in stock_levels:
            #     if quantity_remaining <= 0:
            #         break
            #
            #     if stock.quantity == 0:
            #         continue
            #
            #     to_deduct = min(stock.quantity, quantity_remaining)
            #     stock.quantity -= to_deduct
            #     stock.save(update_fields=['quantity'])
            #
            #     quantity_remaining -= to_deduct
            #
            # if quantity_remaining > 0:
            #     raise ValidationError(
            #         f"Stock insuffisant pour {product.name}. Quantité demandée : {quantity_needed}, disponible : {quantity_needed - quantity_remaining}"
            #     )
            # ------------------------------------------------------------------

            # 2. Créer la ligne de commande
            OrderLine.objects.create(
                order=order,
                product=product,
                quantity=quantity_needed,
                unit_price=product.selling_price,
            )

        # Vérification si la commande contient des lignes valides
        if not order.lignes_commandes.exists():
            raise ValidationError("La commande n'a aucune ligne valide. Aucun stock suffisant.")

        # Mise à jour du total de la commande
        order.update_total()
        cart.items.all().delete()

    return order
