import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String routeName,
  }) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final bool isActive = (currentRoute == routeName || (currentRoute == null && routeName == '/'));

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.green.withValues(alpha: 0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: isActive ? Colors.green[800] : Colors.grey[600], size: 22),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.green[800] : Colors.black87,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          Navigator.of(context).pop();
          if (currentRoute != routeName) {
            Navigator.of(context).pushReplacementNamed(routeName);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildDrawerItem(context: context, icon: Iconsax.grid_1, title: 'Tableau de bord', routeName: '/'),
                _buildDrawerItem(context: context, icon: Iconsax.setting_2, title: 'Gestion Agricole', routeName: '/gestion'),
                
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Divider(height: 1),
                ),

                _buildDrawerItem(context: context, icon: Iconsax.box_1, title: 'Gestion des lots', routeName: '/batches'),
                _buildDrawerItem(context: context, icon: Iconsax.truck_fast, title: 'Livraisons', routeName: '/deliveries'),
                _buildDrawerItem(context: context, icon: Iconsax.receipt_item, title: 'Commandes', routeName: '/orders'),
                _buildDrawerItem(context: context, icon: Iconsax.shopping_bag, title: 'Produits', routeName: '/products'),
                _buildDrawerItem(context: context, icon: Iconsax.archive_book, title: 'Stock', routeName: '/stock'),
                _buildDrawerItem(context: context, icon: Iconsax.house_2, title: 'Entrepôts', routeName: '/warehouses'),
                _buildDrawerItem(context: context, icon: Iconsax.radar, title: 'Suivi logistique', routeName: '/suivi-logistique'),
              ],
            ),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      decoration: BoxDecoration(
        color: Colors.green.shade700,
        image: DecorationImage(
          image: const NetworkImage('https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=1000&auto=format&fit=crop'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.green.shade900.withValues(alpha: 0.7), BlendMode.srcOver),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Iconsax.computing, color: Colors.green, size: 24),
          ),
          const Gap(16),
          const Text(
            'Maliag',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Expert Agricole',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.grey.shade50),
      child: Row(
        children: [
          const Icon(Iconsax.logout, color: Colors.redAccent, size: 20),
          const Gap(12),
          Text('Déconnexion', style: TextStyle(color: Colors.redAccent.shade700, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
