import 'package:flutter/material.dart';

//////////////////-------------------------------------->>>>dietplan
//////////////////-------------------------------------->>>>dietplan
//////////////////-------------------------------------->>>>dietplan
//////////////////-------------------------------------->>>>dietplan
//////////////////-------------------------------------->>>>dietplan
class NutritionPlanScreen extends StatelessWidget {
  final List<Map<String, String>> nutritionPlan;

  NutritionPlanScreen(this.nutritionPlan);

  final List<Color> cardColors = [
    Colors.yellow.shade200,
    Colors.blue.shade200, // Remove the blue color
    Colors.green.shade200, // Change the color for the first card
    Colors.pink.shade200, // Add another color (e.g., red)
    Colors.purple.shade200,
    Colors.orange.shade200,
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: nutritionPlan.length,
        itemBuilder: (context, index) {
          final category = nutritionPlan[index]['category'];
          final items = nutritionPlan[index]['items']?.split(', ');
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: cardColors[index],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          if (category!.toLowerCase().contains('breakfast')) Icon(Icons.free_breakfast, size: 24),
                          if (category.toLowerCase().contains('lunch')) Icon(Icons.restaurant, size: 24),
                          if (category.toLowerCase().contains('snack')) Icon(Icons.fastfood, size: 24),
                          if (category.toLowerCase().contains('dinner')) Icon(Icons.local_dining, size: 24),
                          if (category.toLowerCase().contains('general tips')) Icon(Icons.lightbulb, size: 24),
                          const SizedBox(width: 5),
                          Text(
                            category,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: items!
                          .map((item) => ListTile(
                                leading: Icon(
                                  Icons.arrow_right,
                                  size: 30,
                                ),
                                title: Text(
                                  ' $item',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                minLeadingWidth: 0,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management
////////--------------->>>>>>>>>>>>>Insulin Management

class InsulinManagementScreen extends StatelessWidget {
  final List<Map<String, String>> insulinManagementData;

  InsulinManagementScreen(this.insulinManagementData);

  final List<Color> cardColors = [
    Colors.yellow.shade200,
    Colors.blue.shade200,
    Colors.green.shade200,
    Colors.pink.shade200,
    Colors.orange.shade200,
  ];

  // Define a mapping of section titles to corresponding icons
  final Map<String, IconData> sectionIcons = {
    'Consult with a healthcare provider': Icons.medical_services,
    'Types of insulin': Icons.format_list_bulleted,
    'Insulin delivery methods': Icons.local_hospital,
    'Insulin dosing': Icons.assignment,
    'Blood glucose monitoring': Icons.monitor_weight,
    'Meal planning': Icons.fastfood,
    'Exercise and physical activity': Icons.directions_run,
    'Hypoglycemia (low blood sugar) management': Icons.local_cafe,
    'Hyperglycemia (high blood sugar) management': Icons.local_drink,
    'Regular follow-up': Icons.event,
    'Insulin storage': Icons.ac_unit,
    'Education and support': Icons.lightbulb,
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: insulinManagementData.length,
        itemBuilder: (context, index) {
          final sectionTitle = insulinManagementData[index].keys.first;
          final sectionDescription = insulinManagementData[index].values.first;

          final sectionIcon = sectionIcons[sectionTitle];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Card(
              elevation: 5,
              color: cardColors[index % cardColors.length],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          if (sectionIcon != null) Icon(sectionIcon, size: 24),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              sectionTitle,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text(
                        sectionDescription,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      minLeadingWidth: 0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/////////////------------------------------------------------>>>>>exerciseplan
/////////////------------------------------------------------>>>>>exerciseplan
/////////////------------------------------------------------>>>>>exerciseplan
/////////////------------------------------------------------>>>>>exerciseplan
/////////////------------------------------------------------>>>>>exerciseplan
class ExercisePlanScreen extends StatelessWidget {
  final List<Map<String, String>> exercisePlan;

  ExercisePlanScreen(this.exercisePlan);

  final List<Color> cardColors = [
    Colors.yellow.shade200, // Light Red Accent color
    Colors.blue.shade200, // Light Blue color
    Colors.green.shade200, // Light Green color
    Colors.pink.shade200, // Light Amber color
    Colors.purple.shade200, // Light Purple color
    Colors.teal.shade200, // Light Teal color
    Colors.red.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: exercisePlan.length,
        itemBuilder: (context, index) {
          final day = exercisePlan[index]['day'];
          final activity = exercisePlan[index]['activity'];
          final warmUp = exercisePlan[index]['warmUp'];
          final exercise = exercisePlan[index]['exercise'];
          final coolDown = exercisePlan[index]['coolDown'];
          final monitorBloodSugar = exercisePlan[index]['monitorBloodSugar'];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Card(
              elevation: 5,
              color: cardColors[index],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today, size: 24),
                          const SizedBox(width: 5),
                          Text(
                            day!,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Icon(Icons.directions_walk, size: 30),
                      title: Text(
                        'Activity: $activity',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.accessibility_new),
                      title: Text(
                        'Warm-Up: $warmUp',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.directions_run),
                      title: Text(
                        'Exercise: $exercise',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.whatshot),
                      title: Text(
                        'Cool-Down: $coolDown',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text(
                        'Monitor Blood Sugar: $monitorBloodSugar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

////---------------->>>>>>>>>>>>>>Medication
////---------------->>>>>>>>>>>>>>Medication
////---------------->>>>>>>>>>>>>>Medication
////---------------->>>>>>>>>>>>>>Medication
////---------------->>>>>>>>>>>>>>Medication
////---------------->>>>>>>>>>>>>>Medication
////---------------->>>>>>>>>>>>>>Medication

class MedicationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> medicationData;

  MedicationScreen(this.medicationData);

  final List<Color> cardColors = [
    Colors.yellow.shade200,
    Colors.blue.shade200,
    Colors.green.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: medicationData.length,
        itemBuilder: (context, index) {
          final categoryData = medicationData[index];
          final category = categoryData['category'];
          final medications = categoryData['medications'];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: cardColors[index % cardColors.length],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.medical_services, size: 24),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              'Category: $category',
                              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    for (var medication in medications) MedicationTile(medication: medication),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MedicationTile extends StatelessWidget {
  final Map<String, dynamic> medication;

  MedicationTile({required this.medication});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.health_and_safety_rounded),
          title: Text(
            '${medication['medication_name']}',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          
        ),
        ListTile(
          leading: Icon(Icons.arrow_forward_outlined),
          title: Text(
            '${medication['description']}',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

////-------------------------------------------------->blood monitiring
////-------------------------------------------------->blood monitiring
////-------------------------------------------------->blood monitiring
////-------------------------------------------------->blood monitiring
////-------------------------------------------------->blood monitiring
class BloodGlucoseMonitoringScreen extends StatelessWidget {
  final List<Map<String, String>> diabeticBloodGlucosePlan;

  BloodGlucoseMonitoringScreen({required this.diabeticBloodGlucosePlan});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: diabeticBloodGlucosePlan.length,
        itemBuilder: (context, index) {
          final section = diabeticBloodGlucosePlan[index];
          return BloodGlucoseSectionTile(section: section);
        },
      ),
    );
  }
}

class BloodGlucoseSectionTile extends StatefulWidget {
  final Map<String, String> section;

  BloodGlucoseSectionTile({required this.section});

  @override
  _BloodGlucoseSectionTileState createState() => _BloodGlucoseSectionTileState();
}

class _BloodGlucoseSectionTileState extends State<BloodGlucoseSectionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            initiallyExpanded: isExpanded,
            onExpansionChanged: (expanded) {
              setState(() {
                isExpanded = expanded;
              });
            },
            title: Text(
              widget.section['name']!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            children: [
              for (var key in widget.section.keys)
                if (key != 'name')
                  ListTile(
                    title: Text(
                      key,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    subtitle: Text(
                      widget.section[key] ?? 'No information available',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
