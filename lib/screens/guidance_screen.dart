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
  String disease = '';
  List<Map<String, dynamic>> workPlan = workoutPlans;

  @override
  void initState() {
    super.initState();
    getBMIofUser(FirebaseAuth.instance.currentUser!.uid);
  }

  void getBMIofUser(String id) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
    setState(() {
      disease = userData['past_disease'];
      updateIndex();
    });
  }

  void updateIndex() {
    if (disease == 'Heart' || disease == 'heart' || disease == 'Heart ' ||
        disease == 'heart ') {
      setState(() {
        index = 0;
      });
    } else if (disease == "Diabetes" || disease == "diabetes" ||
        disease == "Diabetes " ||
        disease == "diabetes ") {
      setState(() {
        index = 1;
      });
    } else if (disease == 'Overweight' || disease == 'overweight' ||
        disease == 'Overweight ' ||
        disease == 'overweight ') {
      setState(() {
        index = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excercise'),
      ),
      body: GuidanceCategory(index: index, workPlan: workPlan),
    );
  }
}
