# Generated by Django 4.2.21 on 2025-06-09 20:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0036_remove_product_quantity_in_stock'),
    ]

    operations = [
        migrations.AddField(
            model_name='stockmovement',
            name='is_archived',
            field=models.BooleanField(default=False),
        ),
    ]
