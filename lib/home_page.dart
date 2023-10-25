// ignore_for_file: prefer_const_constructors

import 'package:arogya_mitra/Auth/login_page.dart';
import 'package:arogya_mitra/AuthServices/authService.dart';
import 'package:arogya_mitra/Widgets/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthServices().signOutMethod().then((value) {
                  if (value == true) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  } else {
                    showSnackBar(context, Colors.red, value);
                  }
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
