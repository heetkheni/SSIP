import 'package:arogya_mitra/data/disease_data.dart';
import 'package:arogya_mitra/screens/disease_detail_screen.dart';
import 'package:flutter/material.dart';

class DiseaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Disease List'),
          backgroundColor: Color(0xFF0856DE),
          actions: [
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {},
            ),
          ],
        ),
        body: DiseaseList(
          communicableDiseases: communicableDiseases,
          nonCommunicableDiseases: nonCommunicableDiseasesDetails,
        ),
      ),
    );
  }
}

class DiseaseList extends StatefulWidget {
  final List<Map<String, dynamic>> communicableDiseases;
  final List<Map<String, dynamic>> nonCommunicableDiseases;

  DiseaseList({
    required this.communicableDiseases,
    required this.nonCommunicableDiseases,
  });

  @override
  _DiseaseListState createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredList = [];
  bool showCommunicable = true;

  @override
  void initState() {
    super.initState();
    filteredList = [...widget.communicableDiseases];
  }

  void filterList(String query) {
    setState(() {
      if (showCommunicable) {
        filteredList = widget.communicableDiseases
            .where((disease) =>
                disease['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredList = widget.nonCommunicableDiseases
            .where((disease) =>
                disease['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            onChanged: filterList,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Search',
              hintText: 'Enter disease name',
              prefixIcon: const Icon(Icons.search),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                    color: Color(0xFF0856DE)), // Border color when focused
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                ChoiceChip(
                  label: Text(
                    'Non-Communicable',
                    style: TextStyle(
                      color: showCommunicable
                          ? Colors.white
                          : Colors.white, // Text color
                    ),
                  ),
                  selected: showCommunicable,
                  onSelected: (selected) {
                    setState(() {
                      showCommunicable = selected;
                      filterList(searchController.text);
                    });
                  },
                  backgroundColor: showCommunicable
                      ? Color(0xFF0856DE)
                      : Color(0xFF0856DE), // Background color
                  elevation: 3,
                  pressElevation: 6,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                SizedBox(width: width * 0.08),
                ChoiceChip(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  label: Text(
                    'Communicable',
                    style: TextStyle(
                      color: showCommunicable
                          ? Colors.white
                          : Colors.white, // Text color
                    ),
                  ),
                  selected: !showCommunicable,
                  onSelected: (selected) {
                    setState(() {
                      showCommunicable = !selected;
                      filterList(searchController.text);
                    });
                  },
                  backgroundColor: showCommunicable
                      ? Color(0xFF0856DE)
                      : Colors.blue, // Background color
                  elevation: 3,
                  pressElevation: 6,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final disease = filteredList[index];
              return Card(
                elevation: 1.0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    tileColor: Theme.of(context).cardColor,
                    contentPadding:
                        const EdgeInsets.all(16.0), // Adjust padding as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: Text(
                      disease['name'],
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 17),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DiseaseDetailsPage(disease: disease),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void showDiseaseDetails(Map<String, dynamic> disease) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(disease['name']),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Symptoms: ${disease['symptoms'].join(', ')}'),
              Text('Preventions: ${disease['preventions'].join(', ')}'),
              Text('Medicines: ${disease['medicines'].join(', ')}'),
              Text('Precautions: ${disease['precautions'].join(', ')}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
