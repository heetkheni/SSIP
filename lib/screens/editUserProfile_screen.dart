import 'dart:ffi';

import 'package:arogya_mitra/services/db_services.dart';
import 'package:arogya_mitra/widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({super.key});

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
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

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
                      TextFormField(
                        controller: ageController,
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Age',
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Age can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
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
        'age': ageController.text.toString(),
        'height': heightController.text.toString(),
        'weight': weightController.text.toString(),
        'BMI': bmi.toString()
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
