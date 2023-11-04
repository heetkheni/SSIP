import 'package:flutter/material.dart';
import 'package:arogya_mitra/data/guidanceData.dart';
import 'package:arogya_mitra/screens/guidance_category_screen.dart';

class GuidanceScreen extends StatefulWidget {
  const GuidanceScreen({super.key});

  @override
  State<GuidanceScreen> createState() => _GuidanceScreenState();
}

class _GuidanceScreenState extends State<GuidanceScreen> {
  int index = 0;
  double bmi = 45;
  List<Map<String, dynamic>> workPlan = workoutPlans;

  @override
  Widget build(BuildContext context) {
    if (bmi < 30 && bmi >= 25) {
      index = 0;
    } else if (bmi < 40 && bmi >= 30) {
      index = 1;
    } else if (bmi >= 40) {
      index = 2;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Excercise'),
        ),
        body: GuidanceCategory(index: index, workPlan: workPlan));
  }
}

// class GuidanceDetail extends StatelessWidget {
//   final List<Map<String, dynamic>> guidanceData;
// 
//   GuidanceDetail(this.guidanceData);
// 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Poor BMI Workout Plan'),
//       ),
//       body: ListView.builder(
//         itemCount: guidanceData.length,
//         itemBuilder: (context, index) {
//           final plan = guidanceData[index];
//           final name = plan['name'];
//           final days = plan['days'];
// 
//           return Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Card(
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Text(
//                       name,
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Column(
//                     children: days.entries.map((day) {
//                       final dayName = day.key;
//                       final dayData = day.value;
//                       final warmup = dayData['Warm-up'];
//                       final workout = dayData['Workout'];
//                       final coolDown = dayData['Cool-down'];
// 
//                       return Card(
//                         margin: EdgeInsets.all(10),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 dayName,
//                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(height: 8),
//                               Text("Warm-up: $warmup"),
//                               if (workout is List)
//                                 Column(
//                                   children: workout.map((exercise) {
//                                     return ListTile(
//                                       leading: Icon(Icons.arrow_right, size: 30),
//                                       title: Text(exercise),
//                                       minLeadingWidth: 0,
//                                     );
//                                   }).toList(),
//                                 ),
//                               if (workout is String) Text("Workout: $workout"),
//                               SizedBox(height: 8),
//                               Text("Cool-down: $coolDown"),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
