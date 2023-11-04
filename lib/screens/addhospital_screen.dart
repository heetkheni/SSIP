import 'package:arogya_mitra/widgets/widget.dart';
import 'package:flutter/material.dart';

class AddHospitalScreen extends StatefulWidget {
  const AddHospitalScreen({Key? key}) : super(key: key);

  @override
  _AddHospitalScreenState createState() => _AddHospitalScreenState();
}

class _AddHospitalScreenState extends State<AddHospitalScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final List<String> types = ['PHC', 'UHC', 'CHC'];
  String selectedType = 'PHC';
  final List<String> clusters = [
    "OBSTETRICS AND GYNAECOLOGY",
    "GENERAL MEDICINE",
    "EMERGENCY ROOM PACKAGES (Care Requiring Less Than 12 hrs Stay)",
    "PEAEDIATRIC MEDICAL MANAGEMENT",
  ];
  List<String> selectedClusters = [];

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
            children: [
              DropdownButtonFormField<String>(
                value: selectedType,
                
                items: types.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedType = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Type',
                ),
              ),
              SizedBox(
                height: 23,
              ),
              TextFormField(
                controller: nameController,
                // key: emailFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: textInputDecoration.copyWith(
                  labelText: 'Name',
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Name can not be empty';
                  } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                      .hasMatch(val)) {
                    return "Please enter a valid name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 23,
              ),
              TextFormField(
                controller: districtController ,             // key: emailFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: textInputDecoration.copyWith(
                  labelText: 'Phone',
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Phone can not be empty';
                  } else if (RegExp(r'^[0-9]+$')
                      .hasMatch(val)) {
                    return "Phone only contains number";
                  } else if(val.length !=10){
                    return "Phone enter valid number";
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 23,
              ),
              TextFormField(
                controller: addressController,
                // key: emailFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: textInputDecoration.copyWith(
                  labelText: 'Address',
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Address can not be empty';
                  }else {
                    return null;
                  }
                },
              ),
              Wrap(
                children: clusters.map((cluster) {
                  return FilterChip(
                    label: Text(cluster),
                    selected: selectedClusters.contains(cluster),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedClusters.add(cluster);
                        } else {
                          selectedClusters.remove(cluster);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add the health center data to Firestore
                  final Map<String, dynamic> healthCenterData = {
                    'type': selectedType,
                    'name': nameController.text,
                    'district': districtController.text,
                    'phone': phoneController.text,
                    'address': addressController.text,
                    'clusters': selectedClusters,
                  };
        
                  // Call a function to add the data to Firestore (You'll need to implement this function)
                  addHealthCenter(healthCenterData);
        
                  // Clear the form fields
                  nameController.clear();
                  districtController.clear();
                  phoneController.clear();
                  addressController.clear();
                  selectedClusters.clear();
                  selectedType = 'PHC';
                },
                child: Text('Add Health Center'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Implement this function to add the health center data to Firestore
  void addHealthCenter(Map<String, dynamic> data) {
    // Add your Firestore code here to add the data
  }
}
