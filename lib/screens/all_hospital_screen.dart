import 'package:arogya_mitra/screens/poly_line_screen.dart';
import 'package:flutter/material.dart';
import 'package:arogya_mitra/data/AllHospitalListData.dart';
import 'package:arogya_mitra/screens/all_hospital_detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AllHospitalScreen extends StatefulWidget {
  @override
  _AllHospitalScreenState createState() => _AllHospitalScreenState();
}

class _AllHospitalScreenState extends State<AllHospitalScreen> {
  String selectedType = "All";
  String selectedArea = "All";
  String selectedSpecialty = "All";

  List<String> types = ['All', 'PHC', 'CHC', 'Hospital', 'U-PHC'];
  List<String> talukas = ['All', 'Veraval', 'Gir Gadhda', 'Kodinar', 'Sutrapada', 'Talala', 'Una'];
  List<String> specilities = [
    'All',
    "Cardiology",
    "Orthopedics",
    "Neurology",
    "Oncology",
    "Gastroenterology",
    "Obstetrics and Gynecology",
    "Pediatrics",
    "General Surgery",
    "Internal Medicine",
    "Nephrology",
    "Endocrinology",
    "Urology",
    "ENT (Ear, Nose, and Throat)",
    "Pulmonology",
    "Dermatology"
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredHealthCareCenters = allHealthCareCenters
        .where((center) =>
            (selectedType == "All" || center['type'] == selectedType) &&
            (selectedArea == "All" || center['taluka'] == selectedArea) &&
            (selectedSpecialty == "All" || center['specialities'].contains(selectedSpecialty)))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Healthcare Centers'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildDropdownButton(selectedType, types, (String? newValue) {
                  setState(() {
                    selectedType = newValue!;
                  });
                }, 'Type:'),
                SizedBox(width: 10),
                buildDropdownButton(selectedArea, talukas, (String? newValue) {
                  setState(() {
                    selectedArea = newValue!;
                  });
                }, 'Area:'),
                SizedBox(width: 10),
                buildDropdownButton(selectedSpecialty, specilities, (String? newValue) {
                  setState(() {
                    selectedSpecialty = newValue!;
                  });
                }, 'Specialities:'),
              ],
            ),
          ),
          Expanded(
            child: filteredHealthCareCenters.isEmpty
                ? Center(
                    child: Text(
                      'There are no such health care centers...',
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredHealthCareCenters.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HealthcareCenterDetailsScreen(filteredHealthCareCenters[index]),
                            ),
                          );
                        },
                        child: HealthcareCenterCard(healthcareCenter: filteredHealthCareCenters[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownButton(String value, List<String> items, Function(String?) onChanged, String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 290,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: value,
                        onChanged: onChanged,
                        items: items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HealthcareCenterCard extends StatelessWidget {
  final Map<String, dynamic> healthcareCenter;

  const HealthcareCenterCard({required this.healthcareCenter});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  healthcareCenter['name'],
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  softWrap: true,
                )),
                InkWell(
                  onTap: () {
                    // launchMap(healthcareCenter['latitude'], healthcareCenter['longitude']);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PolylineScreen(destinationLatitude: healthcareCenter['latitude'], destinationLongitude: healthcareCenter['longitude'],)));
                  },
                  child: Icon(
                    Icons.directions,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            RowText(title: 'Type: ', desc: '${healthcareCenter['type']}'),
            RowText(title: 'Taluka: ', desc: '${healthcareCenter['taluka']}'),
          ],
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  String title;
  String desc;

  RowText({Key? key, required this.title, this.desc = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            desc,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

void launchMap(double? latitude, double? longitude) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
