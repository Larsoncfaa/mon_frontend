import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "titre": "Produit bientôt en rupture",
      "message": "Le stock de 'Tomates' est inférieur à 10 unités.",
      "lu": false,
      "date": DateTime.now().subtract(Duration(hours: 2)),
    },
    {
      "titre": "Nouvelle commande",
      "message": "Vous avez reçu une commande du client K. Traoré.",
      "lu": true,
      "date": DateTime.now().subtract(Duration(days: 1)),
    },
  ];

  String formaterDate(DateTime date) {
    return DateFormat("dd/MM/yyyy à HH:mm").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: Icon(
              notif["lu"] ? Icons.notifications_none : Icons.notifications,
              color: notif["lu"] ? Colors.grey : Colors.blue,
            ),
            title: Text(notif["titre"]),
            subtitle: Text("${notif["message"]}\n${formaterDate(notif["date"])}"),
            isThreeLine: true,
            tileColor: notif["lu"] ? Colors.grey[100] : Colors.white,
            onTap: () {
              // Marquer comme lu + naviguer si nécessaire
            },
          );
        },
      ),
    );
  }
}
