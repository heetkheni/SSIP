// main.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddHealthCenterScreens extends StatefulWidget {
  @override
  _AddHealthCenterScreensState createState() => _AddHealthCenterScreensState();
}

class _AddHealthCenterScreensState extends State<AddHealthCenterScreens> {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();

  void _addHealthCenter() {
    FirebaseFirestore.instance.collection('hospitals').add({
      "name": nameController.text,
      "type": typeController.text,
      "address": addressController.text,
      "speciality": specialityController.text,
      "phone": phoneController.text
      // Add other fields as needed
    });

    // Clear text controllers
    nameController.clear();
    addressController.clear();
    typeController.clear();
    phoneController.clear();
    specialityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Health Center'),
      ),
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: typeController,
                decoration: InputDecoration(labelText: 'Type'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: specialityController,
                decoration: InputDecoration(labelText: 'Specialty'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addHealthCenter,
                child: Text('Add Health Center'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}