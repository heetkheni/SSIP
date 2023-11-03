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

  int selectedChipIndex = 0;

  final List<String> chipLabels = [
    'Begineer',
    'Intermediate',
    'Advanced',
  ];

  final List<Color> chipColors = [
    Color(0xFF0856DE),
    Color(0xFF0856DE),
    Color(0xFF0856DE),
  ];

  void onChipTap(int index) {
    setState(() {
      selectedChipIndex = index;
    });
  }

  Widget buildContent() {
    switch (selectedChipIndex) {
      case 0:
        return GuidanceCategory(index: 0, workPlan: workPlan);
      case 1:
        return GuidanceCategory(index: 1, workPlan: workPlan);

      case 2:
        return GuidanceCategory(index: 2, workPlan: workPlan);
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excercise'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 6,
                children: List.generate(
                  chipLabels.length,
                  (index) {
                    return ActionChip(
                      label: Text(chipLabels[index]),
                      backgroundColor: selectedChipIndex == index
                          ? Colors.white // Color for the selected chip
                          : chipColors[index],
                      labelStyle: TextStyle(
                        color: selectedChipIndex == index ? Colors.black : Colors.white, // Text color for selected chip
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 3), // Adjust label padding
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      side: BorderSide(
                        color: selectedChipIndex == index
                            ? chipColors[index] // Color for the selected chip
                            : Colors.black,
                      ),
                      onPressed: () {
                        onChipTap(index);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          buildContent(),
        ],
      ),
      // Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: workPlan.length,
      //         itemBuilder: (context, index) {
      //           return Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 8),
      //                 child: Container(
      //                   height: 150,
      //                   width: double.infinity,
      //                   child: InkWell(
      //                     onTap: () {
      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) => GuidanceCategory(
      //                             index: index,
      //                             workPlan: workPlan,
      //                           ),
      //                         ),
      //                       );
      //                     },
      //                     child: Card(
      //                       color: Colors.blue[200],
      //                       shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
      //                       elevation: 2,
      //                       child: Container(
      //                         child: Center(
      //                           child: Text(
      //                             workPlan[index]['name'].toString(),
      //                             style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.w500),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

// Column(
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Wrap(
//                 spacing: 10,
//                 runSpacing: 6,
//                 children: List.generate(
//                   chipLabels.length,
//                   (index) {
//                     return ActionChip(
//                       label: Text(chipLabels[index]),
//                       backgroundColor: selectedChipIndex == index
//                           ? Colors.white // Color for the selected chip
//                           : chipColors[index],
//                       labelStyle: TextStyle(
//                         color: selectedChipIndex == index
//                             ? Colors.black
//                             : Colors.white, // Text color for selected chip
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       side: BorderSide(
//                         color: selectedChipIndex == index
//                           ?  chipColors[index] // Color for the selected chip
//                           : Colors.black,
//                       ),
//                       onPressed: () {
//                         onChipTap(index);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//           buildContent(),
//         ],
//       ),
