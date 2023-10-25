// ignore_for_file: prefer_const_constructors

import 'package:arogya_mitra/Auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'arogya_mitra',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}




