import 'package:flutter/material.dart';

class NotificationItem {
  final String titre;
  final String contenu;
  final bool lu;
  final DateTime date;

  NotificationItem({
    required this.titre,
    required this.contenu,
    required this.lu,
    required this.date,
  });
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
      titre: "Commande livrée",
      contenu: "Votre commande #CMD123 a été livrée avec succès.",
      lu: false,
      date: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationItem(
      titre: "Produit en promotion",
      contenu: "Le riz local est en réduction pendant 48h.",
      lu: true,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  void _marquerCommeLue(int index) {
    setState(() {
      notifications[index] = NotificationItem(
        titre: notifications[index].titre,
        contenu: notifications[index].contenu,
        lu: true,
        date: notifications[index].date,
      );
    });

    // TODO: PATCH vers /notifications/{id}/ (lu = true)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Card(
            color: notif.lu ? Colors.grey[100] : Colors.white,
            elevation: notif.lu ? 1 : 3,
            child: ListTile(
              title: Text(
                notif.titre,
                style: TextStyle(
                  fontWeight: notif.lu ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Text(notif.contenu),
              trailing: notif.lu
                  ? null
                  : IconButton(
                icon: const Icon(Icons.check_circle_outline),
                onPressed: () => _marquerCommeLue(index),
                tooltip: "Marquer comme lu",
              ),
            ),
          );
        },
      ),
    );
  }
}
