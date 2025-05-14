import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  String nom = "Diallo Fatoumata";
  String email = "fatou@example.com";
  String localisation = "Bamako, Mali";
  double solde = 1500.0;

  final TextEditingController _nomCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomCtrl.text = nom;
    _emailCtrl.text = email;
  }

  void _sauvegarderProfil() {
    setState(() {
      nom = _nomCtrl.text;
      email = _emailCtrl.text;
    });

    // TODO: envoyer PUT vers /users/{id}/ ou /clients/
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profil mis à jour")),
    );
  }

  void _deconnexion() {
    // TODO: supprimer token, naviguer vers login
    Navigator.of(context).pushReplacementNamed('/auth/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mon Profil")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _infoCarte(),
          const SizedBox(height: 24),
          _champ("Nom", _nomCtrl),
          const SizedBox(height: 12),
          _champ("Email", _emailCtrl),
          const SizedBox(height: 12),
          _infoLigne("Localisation", localisation),
          const SizedBox(height: 12),
          _infoLigne("Solde disponible", "${solde.toStringAsFixed(0)} FCFA"),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _sauvegarderProfil,
            icon: const Icon(Icons.save),
            label: const Text("Sauvegarder"),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _deconnexion,
            icon: const Icon(Icons.logout),
            label: const Text("Se déconnecter"),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _infoCarte() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, size: 32, color: Colors.white),
        ),
        title: Text(nom, style: const TextStyle(fontSize: 18)),
        subtitle: Text(email),
      ),
    );
  }

  Widget _champ(String label, TextEditingController ctrl) {
    return TextField(
      controller: ctrl,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _infoLigne(String titre, String valeur) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titre, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(valeur),
      ],
    );
  }
}
