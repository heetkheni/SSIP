import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:arogya_mitra/data/hospitalData.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Care Centers'),
      ),
      // body: ListView.builder(
      //   itemCount: healthCareCenters.length,
      //   itemBuilder: (context, index) {
      //     final center = healthCareCenters[index];
      //     return Card(
      //       elevation: 1.0,
      //       margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(15.0),
      //       ),
      //       child: Container(
      //           height: 80,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(15.0),
      //           ),
      //           child: ListTile(
      //             title: Text(
      //               center['name'],
      //               style: TextStyle(fontWeight: FontWeight.bold),
      //             ),
      //             subtitle: Text(
      //               center['address'],
      //               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
      //             ),
      //             leading: CircleAvatar(
      //               radius: 25,
      //               backgroundColor: Theme.of(context).primaryColor,
      //               child: Text(
      //                 center['name'].substring(0, 1).toUpperCase(),
      //                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      //               ),
      //             ),
      //             onTap: () {
      //               // Navigate to the PHC detail screen when the ListTile is tapped
      //               Navigator.of(context).push(
      //                 MaterialPageRoute(
      //                   builder: (context) => PHCDetailScreen(center),
      //                 ),
      //               );
      //             },
      //           )),
      //     );
      //   },
      // ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('hospitals').snapshots(),
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
            String address = hospitalData['address'] ?? 'No Address';

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
    );
  }
}

class PHCDetailScreen extends StatelessWidget {
  final Map<String, dynamic> phcData;

  PHCDetailScreen(this.phcData);

  @override
  Widget build(BuildContext context) {
    final List<String> clusters = phcData['clusters'] as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(phcData['name']),
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 8, left: 8),
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(19),
                  color: Theme.of(context).primaryColor,
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/clinic.png',
                      height: 80,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type: ${phcData['type']}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'District: ${phcData['district']}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Address: ${phcData['address']}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 8, left: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: Colors.blue[100],
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: clusters.map((cluster) {
                    return ListTile(
                      leading: Icon(Icons.arrow_right_outlined),
                      title: Text(
                        cluster,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
// Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Type: ${phcData['type']}',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text('District: ${phcData['district']}'),
//             Text('Address: ${phcData['address']}'),
//             SizedBox(height: 16.0),
//             Text(
//               'Clusters:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//
//             Wrap(
//               spacing: 2.0,
//               children: clusters.map((cluster) {
//                 return Chip(
//                   label: Text(cluster),
//                   backgroundColor: Theme.of(context).primaryColor,
//                   labelStyle: TextStyle(color: Colors.white),
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
    );
  }
}

// class VaccineCard extends StatelessWidget {
//   final Map<String, dynamic> vaccine;
//
//   VaccineCard({required this.vaccine});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
//       child: Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(19.0),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(19),
//           ),
//           padding: EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               Image.asset(
//                 'assets/images/vaccine1.png',
//                 height: 50, // Adjust the height as needed
//               ),
//               const SizedBox(width: 16.0),
//               Expanded(
//                 child: Text(
//                   vaccine['name'],
//                   style: const TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class VaccineDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> vaccine;
//
//   VaccineDetailsPage({required this.vaccine});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Vaccine Details'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(19.0),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 15, right: 8, left: 8),
//               child: Container(
//                 height: 130,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(19),
//                   color: Theme.of(context).primaryColor,
//                 ),
//                 padding: EdgeInsets.all(10.0),
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       'assets/images/vaccine3.png',
//                       height: 100,
//                     ),
//                     const SizedBox(width: 16.0),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             vaccine['name'],
//                             style: const TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Text(
//                             'Market Price : ${vaccine['marketPriceInRupees']}',
//                             style: const TextStyle(
//                               fontSize: 18.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(19.0),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 15, right: 8, left: 8),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(19),
//                   color: Colors.blue[100],
//                 ),
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     RowText(title: 'Usage: ', desc: '${vaccine['shortUsage']}'),
//                     const SizedBox(height: 7),
//                     RowText(
//                         title: 'Total Doses: ',
//                         desc: '${vaccine['totalDoses']}'),
//                     const SizedBox(height: 7),
//                     RowText(title: 'Dose Details: '),
//                     Column(
//                       children:
//                           (vaccine['doseDetails'] as List).map<Widget>((dose) {
//                         return RowText(
//                           title: '\t\t\t\t\t\t\t\tDose ${dose['doseNumber']}: ',
//                           desc: '${dose['time']}',
//                         );
//                       }).toList(),
//                     ),
//                     const SizedBox(height: 7),
//                     RowText(
//                         title: 'Detailed Use: ',
//                         desc: '${vaccine['detailedUse']}'),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
