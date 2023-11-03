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
        title: Text('PHC Care Centers'),
      ),
      body: ListView.builder(
        itemCount: healthCareCenters.length,
        itemBuilder: (context, index) {
          final center = healthCareCenters[index];
          return Card(
            elevation: 1.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  title: Text(
                    center['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    center['address'],
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                  ),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      center['name'].substring(0, 1).toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () {
                    // Navigate to the PHC detail screen when the ListTile is tapped
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PHCDetailScreen(center),
                      ),
                    );
                  },
                )),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Type: ${phcData['type']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('District: ${phcData['district']}'),
            Text('Address: ${phcData['address']}'),
            SizedBox(height: 16.0),
            Text(
              'Clusters:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 2.0,
              children: clusters.map((cluster) {
                return Chip(
                  label: Text(cluster),
                  backgroundColor: Theme.of(context).primaryColor,
                  labelStyle: TextStyle(color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
