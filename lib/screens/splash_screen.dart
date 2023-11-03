import 'dart:async';

import 'package:arogya_mitra/auth/login_screen.dart';
import 'package:arogya_mitra/screens/home_screen.dart';
import 'package:arogya_mitra/services/db_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final auth = FirebaseAuth.instance;

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final user = auth.currentUser;

    if (user != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Image.asset(
          'assets/images/heart.png',
        ),
      )),
    );
  }
}
