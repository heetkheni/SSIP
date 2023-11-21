// ignore_for_file: prefer_const_constructors

import 'package:arogya_mitra/screens/notification_screen.dart';
import 'package:arogya_mitra/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
     FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundhandler);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundhandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'arogya_mitra',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}





