import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arogya_mitra/data/guidanceData.dart';
import 'package:arogya_mitra/screens/guidance_category_screen.dart';

class GuidanceScreen extends StatefulWidget {
  const GuidanceScreen({super.key});

  @override
  State<GuidanceScreen> createState() => _GuidanceScreenState();
}

class _GuidanceScreenState extends State<GuidanceScreen> {
  int index = 0;
  double bmi = 0;
  List<Map<String, dynamic>> workPlan = workoutPlans;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBMIofUser(FirebaseAuth.instance.currentUser!.uid);
  }

  getBMIofUser(String id) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
    setState(() {
      bmi = userData['BMI'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (bmi < 30 && bmi >= 0) {
      index = 0;
    } else if (bmi < 40 && bmi >= 30) {
      index = 1;
    } else if (bmi >= 40) {
      index = 2;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Excercise'),
        ),
        body: GuidanceCategory(index: index, workPlan: workPlan));
  }
}

