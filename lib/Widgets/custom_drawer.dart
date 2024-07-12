import 'package:arogya_mitra/screens/add_healthcenter.dart';
import 'package:arogya_mitra/screens/addhospital_screen.dart';
import 'package:arogya_mitra/screens/notification_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/sample_avatar.jpg'), // Replace with your avatar image
                ),
                SizedBox(height: 10),
                Text(
                  'Sample Username', // Replace with your username
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),

           ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Add Vaccine'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddHealthCenterScreen()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Add Health Center'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddHealthCenterScreens()),
              );
            },
          ),
          // Add more ListTiles for other options if needed
        ],
      ),
    );
  }
}
