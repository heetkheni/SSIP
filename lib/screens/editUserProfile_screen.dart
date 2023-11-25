import 'dart:ffi';

import 'package:arogya_mitra/services/db_services.dart';
import 'package:arogya_mitra/widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditUserProfileScreen extends StatefulWidget {
  String fullName;
  String phone;
  String address;
  String age;
  String height;
  String weight;
  String bmi;
  String bg;
  String pastDisease;

  EditUserProfileScreen({
    super.key,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.age,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.bg,
    required this.pastDisease,
  });

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController bmiController = TextEditingController();
  final TextEditingController bgController = TextEditingController();
  final TextEditingController pastdiseaseController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void initState() {
    super.initState();

    fullNameController.text = widget.fullName;
    phoneController.text = widget.phone;
    addressController.text = widget.address;
    ageController.text = widget.age;
    heightController.text = widget.height;
    weightController.text = widget.weight;
    bmiController.text = widget.bmi;
    bgController.text = widget.bg;
    pastdiseaseController.text = widget.pastDisease;
  }

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        calculateAge();
      });
    }
  }

  void calculateAge() {
    if (selectedDate != null) {
      final now = DateTime.now();
      final difference = now.difference(selectedDate!);
      final ageInYears = difference.inDays ~/ 365;

      setState(() {
        widget.age = ageInYears.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Edit Your Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: fullNameController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Name can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Phone can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: addressController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Address',
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'address can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select Date of Birth'),
                      ),
                      SizedBox(height: 16.0),
                      Text('Age: ${widget.age} years'),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: heightController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Height (in Meter)',
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Height can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: weightController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Weight (in Kg)',
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Wight can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: bgController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Blood group',
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Blodd Group can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: pastdiseaseController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Past Disease',
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Wight can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          uploadEditedData(); // Navigate back to the profile screen
                        },
                        child: Text("Save"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  uploadEditedData() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);
      double bmi = weight / (height * height);

      Map<String, dynamic> userDataMap = {
        'fullName': fullNameController.text.toString(),
        'address': addressController.text.toString(),
        'phone': phoneController.text.toString(),
        'age': widget.age.toString(),
        'height': heightController.text.toString(),
        'weight': weightController.text.toString(),
        'BMI': bmi.toString(),
        'BG': bgController.text.toString(),
        'past_disease': pastdiseaseController.text.toString(),
      };

      await DatabaseServices()
          .updateUserProfile(
              FirebaseAuth.instance.currentUser!.uid, userDataMap)
          .then((value) {
        if (value == true) {
          setState(() {
            isLoading = false;
          });
          Navigator.of(context).pop();
        }
      });
    }
  }
}
