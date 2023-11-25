// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserNotificationScreen extends StatefulWidget {
//   @override
//   State<UserNotificationScreen> createState() => _UserNotificationScreenState();
// }

// class _UserNotificationScreenState extends State<UserNotificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference notificationCollection =
//         FirebaseFirestore.instance.collection('notifications');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: notificationCollection.snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }

//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(
//               child: Text('No notifications available.'),
//             );
//           }

//           var notifications = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: notifications.length,
//             itemBuilder: (context, index) {
//               var title = notifications[index]['title'];
//               var body = notifications[index]['body'];
//               var description = notifications[index]['description'];
//               var imageUrl = notifications[index]['imageUrl'];

//               return Container(
//                 padding: EdgeInsets.all(16.0),
//                 margin: EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(body),
//                     SizedBox(height: 8.0),
//                     Text(description),
//                     if (imageUrl != null) // Display image if URL is available
//                       Image.network(
//                         imageUrl,
//                         width: 150.0,
//                         height: 150.0,
//                         fit: BoxFit.cover,
//                       ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }



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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No notifications available.'),
            );
          }

          var notifications = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              var title = notifications[index]['title'];
              var body = notifications[index]['body'];
              //var description = notifications[index]['description'];
              var imageUrl = notifications[index]['imageUrl'];

              return Card(
                margin: EdgeInsets.all(10.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(body),
                      SizedBox(height: 8.0),
                      // Text(description),
                      // SizedBox(height: 8.0),
                      if (imageUrl != null) // Display image if URL is available
                        SizedBox(
                          height: 300.0,
                          width: double.infinity,
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
