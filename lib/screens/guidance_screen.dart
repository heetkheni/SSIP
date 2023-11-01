import 'package:flutter/material.dart';
import 'package:arogya_mitra/data/guidanceData.dart';
import 'package:arogya_mitra/screens/guidance_category_screen.dart';

class GuidanceScreen extends StatefulWidget {
  const GuidanceScreen({super.key});

  @override
  State<GuidanceScreen> createState() => _GuidanceScreenState();
}

class _GuidanceScreenState extends State<GuidanceScreen> {
  List<Map<String, dynamic>> workPlan = workoutPlans;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: workPlan.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 8, top: 8),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GuidanceCategory(
                                  index: index,
                                  workPlan: workPlan,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.blue[200],
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            elevation: 2,
                            child: Container(
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //     image: NetworkImage(
                              //       'https://images.pexels.com/photos/1552252/pexels-photo-1552252.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              //     ),
                              //     opacity: 0.9,
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                              child: Center(
                                child: Text(
                                  workPlan[index]['name'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
