import 'package:flutter/material.dart';

import '../vues/client/mes_demande.dart';
import '../vues/client/tracking_map_screen.dart';

class ClientDrawerWidget extends StatelessWidget {
  final int? deliveryId;
  final double? latitude;
  final double? longitude;

  const ClientDrawerWidget({
    super.key,
    this.deliveryId,
    this.latitude,
    this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            accountName: Text("Bienvenue !"),
            accountEmail: Text("client@exemple.com"), // À personnaliser
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Ajoute une image dans assets si souhaité
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Accueil'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Mon panier'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Mon profil'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.assignment),
                  title: const Text('Mes demandes'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MesDemandesScreen(),
                      ),
                    );
                  },
                ),
                if (deliveryId != null)
                  ListTile(
                    leading: const Icon(Icons.delivery_dining),
                    title: const Text('Suivi de livraison'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TrackingMapScreen(
                            deliveryId: deliveryId!,
                            latitude: latitude,
                            longitude: longitude,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Déconnexion'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Ajoute ici ta logique de déconnexion (vider token, naviguer vers login...)
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
