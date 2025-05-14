import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcranProfilAgriculteur extends StatelessWidget {
  const EcranProfilAgriculteur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil agriculteur")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/images/agriculteur.png")),
          const SizedBox(height: 12),
          const Center(child: Text("Nom Agriculteur", style: TextStyle(fontSize: 18))),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Iconsax.setting_2),
            title: const Text("Paramètres"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Iconsax.info_circle),
            title: const Text("À propos"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Iconsax.logout),
            title: const Text("Déconnexion"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
