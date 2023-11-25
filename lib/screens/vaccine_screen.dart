//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:arogya_mitra/data/vaccineData.dart';

class VaccineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine'),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('vaccines').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          var hospitals = snapshot.data!.docs;

          // Create a list of Widgets to display each hospital
          List<Widget> hospitalWidgets = [];
          for (var hospital in hospitals) {
            var hospitalData = hospital.data() as Map<String, dynamic>;

            // Use the null-aware operator to handle null values
            String name = hospitalData['name'] ?? 'No Name';
            String address = hospitalData['usage'] ?? 'No Address';

            hospitalWidgets.add(
              ListTile(
                title: Text(name),
                subtitle: Text(address),
                // Add more details as needed
              ),
            );
          }
          return Column(
            children: hospitalWidgets,
          );
        },
      ),
      // body: ListView(
      //   children: List.generate(
      //     vaccineList.length,
      //     (index) {
      //       final vaccine = vaccineList[index];
      //       return GestureDetector(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => VaccineDetailsPage(vaccine: vaccine),
      //             ),
      //           );
      //         },
      //         child: VaccineCard(vaccine: vaccine),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
