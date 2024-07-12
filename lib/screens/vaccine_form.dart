import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VaccineFormPage extends StatefulWidget {
  @override
  _VaccineFormPageState createState() => _VaccineFormPageState();
}

class _VaccineFormPageState extends State<VaccineFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController usageController = TextEditingController();
  final TextEditingController totalDoseController = TextEditingController();

  final CollectionReference _vaccines =
      FirebaseFirestore.instance.collection('vaccines');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: usageController,
              decoration: InputDecoration(labelText: 'Usage'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: totalDoseController,
              decoration: InputDecoration(labelText: 'Total Dose'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                await _addVaccineData();
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await _getVaccineData();
              },
              child: Text("Fetch Data"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addVaccineData() async {
    final String name = nameController.text;
    final int age = int.tryParse(ageController.text) ?? 0;
    final String usage = usageController.text;
    final int totalDose = int.tryParse(totalDoseController.text) ?? 0;

    try {
      await _vaccines.add({
        "name": name,
        "age": age,
        "usage": usage,
        "totalDose": totalDose,
      });
      print("Vaccine data added successfully");
    } catch (e) {
      print("Error adding vaccine data: $e");
    }
  }

  Future<void> _getVaccineData() async {
    try {
      QuerySnapshot querySnapshot = await _vaccines.get();
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        print('ID: ${document.id}, Data: ${document.data()}');
      }
    } catch (e) {
      print("Error fetching vaccine data: $e");
    }
  }
}
