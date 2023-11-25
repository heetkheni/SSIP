import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserNotificationScreen extends StatefulWidget {
  

  

  @override
  State<UserNotificationScreen> createState() => _UserNotificationScreenState();
}

class _UserNotificationScreenState extends State<UserNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference notificationCollection =
        FirebaseFirestore.instance.collection('notifications');
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: notificationCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          var notifications = snapshot.data!.docs;

          List<Widget> notificationWidgets = [];
          for (var notification in notifications) {
            var title = notification['title'];
            var body = notification['body'];
            var description = notification['description'];
            //var imageUrl = notification['imageUrl'];

            var notificationWidget = ListTile(
              title: Text(title),
              subtitle: Text(body),
              onTap: () {
                // Handle tapping on a notification (if needed)
              },
            );

            notificationWidgets.add(notificationWidget);
          }

          return ListView(
            children: notificationWidgets,
          );
        },
      ),
    );
  }
}
