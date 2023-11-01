import 'package:flutter/material.dart';

class DiseaseDetailsPage extends StatelessWidget {
  final Map<String, dynamic> disease;

  DiseaseDetailsPage({required this.disease});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(disease['name']),
        //backgroundColor:Color.fromARGB(255, 22, 128, 208),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard("Symptoms", disease['symptoms'], Icons.warning,
                Colors.yellow[100]!, context),
            SizedBox(height: height * 0.02),
            _buildCard("Preventions", disease['preventions'], Icons.lightbulb,
                Colors.blue[100]!, context),
            SizedBox(height: height * 0.02),
            _buildCard("Medicines", disease['medicines'], Icons.local_pharmacy,
                Colors.green[100]!, context),
            SizedBox(height: height * 0.02),
            _buildCard("Precautions", disease['precautions'], Icons.shield,
                Colors.pink[100]!, context),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, List<String> items, IconData icon,
      Color cardColor, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5.0,
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 24.0,
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // SizedBox(height: height * 0.01),
            for (String item in items)
              Container(
                height: 45,
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_right,
                    size: 30,
                  ),
                  title: Text(item),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
