import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String routeName,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green[800]),
      title: Text(title),
      onTap: () {
        // On ferme d'abord le Drawer
        Navigator.of(context).pop();

        // On récupère la route courante (ou null si aucune)
        final currentRoute = ModalRoute.of(context)?.settings.name;

        // Si la route souhaitée est différente (ou si currentRoute est null),
        // on navigue vers cette route en remplaçant la route courante.
        if (currentRoute == null || currentRoute != routeName) {
          Navigator.of(context).pushReplacementNamed(routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green[700]),
              child: const Center(
                child: Text(
                  'Menu Maliag',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Tableau de bord (route racine)
            _buildDrawerItem(
              context: context,
              icon: Icons.dashboard,
              title: 'Tableau de bord',
              routeName: '/',
            ),

            // Gestion agricole
            _buildDrawerItem(
              context: context,
              icon: Icons.settings,
              title: 'Gestion Agricole',
              routeName: '/gestion',
            ),

            const Divider(),

            // Gestion des lots
            _buildDrawerItem(
              context: context,
              icon: Icons.list_alt,
              title: 'Gestion des lots',
              routeName: '/batches',
            ),

            // Gestion des livraisons
            _buildDrawerItem(
              context: context,
              icon: Icons.local_shipping,
              title: 'Gestion des livraisons',
              routeName: '/deliveries',
            ),

            // Gestion des commandes
            _buildDrawerItem(
              context: context,
              icon: Icons.shopping_basket,
              title: 'Gestion des commandes',
              routeName: '/orders',
            ),

            // Gestion des produits
            _buildDrawerItem(
              context: context,
              icon: Icons.production_quantity_limits,
              title: 'Gestion des produits',
              routeName: '/products',
            ),

            // Gestion du stock
            _buildDrawerItem(
              context: context,
              icon: Icons.inventory_2,
              title: 'Gestion du stock',
              routeName: '/stock',
            ),

            // Entrepôts
            _buildDrawerItem(
              context: context,
              icon: Icons.warehouse,
              title: 'Entrepôts',
              routeName: '/warehouses',
            ),

            // Suivi logistique
            _buildDrawerItem(
              context: context,
              icon: Icons.track_changes, // ou Icons.receipt_long
              title: 'Suivi logistique',
              routeName: '/suivi-logistique',
            ),
          ],
        ),
      ),
    );
  }
}
