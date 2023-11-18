import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthcareCenterDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> healthcareCenter;

  HealthcareCenterDetailsScreen(this.healthcareCenter);

  @override
  Widget build(BuildContext context) {
    final List<String> clusters = healthcareCenter['clusters'] as List<String>;
    final List<String> specialities = healthcareCenter['specialities'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(healthcareCenter['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        'assets/images/hospital.png',
                        height: 80,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RowText(
                              title: 'Type:',
                              desc: '${healthcareCenter['type']}',
                              clrTitle: Colors.white,
                              clrDesc: Colors.white,
                            ),
                            RowText(title: 'Address:', desc: '${healthcareCenter['address']}', clrTitle: Colors.white, clrDesc: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            NameBetweenSpace(name: 'Information:'),
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 8, left: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.0),
                ),
                color: Colors.blue[100],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RowText(title: 'Area:', desc: '${healthcareCenter['area'] ?? 'N/A'}', sz: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RowText(title: 'Taluka:', desc: '${healthcareCenter['taluka'] ?? 'N/A'}', sz: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () async {
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: '${healthcareCenter['phone'] ?? 'N/A'}',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("Can't connect");
                            }
                          },
                          child: RowText(title: 'Phone:', desc: '${healthcareCenter['phone'] ?? 'N/A'}', sz: 18, clrDesc: Colors.purple),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () async {
                            String? encodeQueryParameters(Map<String, String> params) {
                              return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
                            }

                            final Uri emailurl = Uri(
                              scheme: 'mailto',
                              path: '${healthcareCenter['email'] ?? 'N/A'}',
                              query: encodeQueryParameters(<String, String>{
                                'subject': 'About my health!',
                              }),
                            );
                            if (await canLaunchUrl(emailurl)) {
                              await launchUrl(emailurl);
                            } else {
                              print("Can't connect");
                            }
                          },
                          child: RowText(
                            title: 'Email:',
                            desc: '${healthcareCenter['email'] ?? 'N/A'}',
                            sz: 18,
                            clrDesc: Colors.purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            NameBetweenSpace(name: 'Specialities:'),
            NameAndCard(name: 'Specialities:', category: specialities),
            NameBetweenSpace(name: 'Clusters:'),
            NameAndCard(name: 'Clusters:', category: clusters),
          ],
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  String title;
  String desc;
  Color clrTitle;
  Color clrDesc;
  double sz;

  RowText({Key? key, required this.title, this.desc = '', this.clrTitle = Colors.black, this.clrDesc = Colors.black, this.sz = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: sz,
            color: clrTitle,
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            desc,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: sz,
              color: clrDesc,
            ),
          ),
        ),
      ],
    );
  }
}

class NameBetweenSpace extends StatelessWidget {
  String name;
  NameBetweenSpace({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Icon(Icons.circle_sharp, size: 13),
            SizedBox(width: 5),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class NameAndCard extends StatelessWidget {
  String name;
  List<String> category;
  NameAndCard({super.key, required this.name, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 8, left: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.0),
        ),
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: category.map((cluster) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_right_outlined),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        cluster,
                        softWrap: true,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
