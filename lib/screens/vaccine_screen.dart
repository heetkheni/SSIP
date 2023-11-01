import 'package:flutter/material.dart';
import 'package:arogya_mitra/data/vaccineData.dart';

class VaccineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine'),
      ),
      body: ListView(
        children: List.generate(
          vaccineList.length,
          (index) {
            final vaccine = vaccineList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VaccineDetailsPage(vaccine: vaccine),
                  ),
                );
              },
              child: VaccineCard(vaccine: vaccine),
            );
          },
        ),
      ),
    );
  }
}

class VaccineCard extends StatelessWidget {
  final Map<String, dynamic> vaccine;

  VaccineCard({required this.vaccine});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(19),
          ),
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/vaccine1.png',
                height: 50, // Adjust the height as needed
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  vaccine['name'],
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VaccineDetailsPage extends StatelessWidget {
  final Map<String, dynamic> vaccine;

  VaccineDetailsPage({required this.vaccine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Details'),
        centerTitle: true,
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
                      'assets/images/vaccine3.png',
                      height: 100,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vaccine['name'],
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Market Price : ${vaccine['marketPriceInRupees']}',
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
                  children: [
                    RowText(title: 'Usage: ', desc: '${vaccine['shortUsage']}'),
                    const SizedBox(height: 7),
                    RowText(
                        title: 'Total Doses: ',
                        desc: '${vaccine['totalDoses']}'),
                    const SizedBox(height: 7),
                    RowText(title: 'Dose Details: '),
                    Column(
                      children:
                          (vaccine['doseDetails'] as List).map<Widget>((dose) {
                        return RowText(
                          title: '\t\t\t\t\t\t\t\tDose ${dose['doseNumber']}: ',
                          desc: '${dose['time']}',
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 7),
                    RowText(
                        title: 'Detailed Use: ',
                        desc: '${vaccine['detailedUse']}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RowText extends StatelessWidget {
  String title;
  String desc;

  RowText({super.key, required this.title, this.desc = ''});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        Expanded(
            child: Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        )),
      ],
    );
  }
}
