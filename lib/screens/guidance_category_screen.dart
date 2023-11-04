import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GuidanceCategory extends StatefulWidget {
  int index;
  List<Map<String, dynamic>> workPlan;
  GuidanceCategory({super.key, required this.index, required this.workPlan});

  @override
  State<GuidanceCategory> createState() => _GuidanceCategoryState();
}

class _GuidanceCategoryState extends State<GuidanceCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ContainerWidget(
            days: 'Monday',
            index: widget.index,
            workPlan: widget.workPlan,
            colors: 0,
          ),
          ContainerWidget(
            days: 'Tuesday',
            index: widget.index,
            workPlan: widget.workPlan,
            colors: 1,
          ),
          ContainerWidget(
            days: 'Wednesday',
            index: widget.index,
            workPlan: widget.workPlan,
            colors: 2,
          ),
          ContainerWidget(
            days: 'Thursday',
            index: widget.index,
            workPlan: widget.workPlan,
            colors: 3,
          ),
          ContainerWidget(
            days: 'Friday',
            index: widget.index,
            workPlan: widget.workPlan,
            colors: 4,
          ),
          ContainerWidget(
            days: 'Saturday',
            index: widget.index,
            workPlan: widget.workPlan,
            colors: 5,
          ),
          ContainerWidget(
            days: 'Sunday',
            index: widget.index,
            workPlan: widget.workPlan,
            colors: 6,
          ),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final int colors;
  final String days;
  final int index;
  final List<Map<String, dynamic>> workPlan;

  final List<Color> cardColors = [Colors.yellow.shade200, Colors.blue.shade200, Colors.green.shade200, Colors.pink.shade200, Colors.purple.shade200, Colors.orange.shade200, Colors.red.shade200];

  ContainerWidget({Key? key, required this.days, required this.index, required this.workPlan, required this.colors}) : super(key: key);

  Icon getDayIcon(String day) {
    switch (day.toLowerCase()) {
      case 'monday':
        return Icon(Icons.calendar_today, size: 24);
      case 'tuesday':
        return Icon(Icons.calendar_today, size: 24);
      case 'wednesday':
        return Icon(Icons.calendar_today, size: 24);
      case 'thursday':
        return Icon(Icons.calendar_today, size: 24);
      case 'friday':
        return Icon(Icons.calendar_today, size: 24);
      case 'saturday':
        return Icon(Icons.calendar_today, size: 24);
      case 'sunday':
        return Icon(Icons.calendar_today, size: 24);
      default:
        return Icon(Icons.calendar_today, size: 24);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: cardColors[colors],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    getDayIcon(days),
                    const SizedBox(width: 5),
                    Text(
                      days,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.accessibility_new),
                title: Text(
                  days == 'Sunday' ? workPlan[index]['days'][days] : 'Warm-up: ${workPlan[index]['days'][days]['Warm-up'].toString()}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(days == 'Sunday' ? Icons.no_luggage_outlined : Icons.directions_walk, size: 30),
                title: Text(
                  days == 'Sunday' ? '' : 'Workout: ${workPlan[index]['days'][days]['Workout'].toString()}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(days == 'Sunday' ? Icons.no_luggage_outlined : Icons.whatshot),
                title: Text(
                  days == 'Sunday' ? '' : 'Cool-down: ${workPlan[index]['days'][days]['Cool-down'].toString()}',
                  style: TextStyle(
                    fontSize: 18,
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

class PoorBMIPlanScreen extends StatelessWidget {
  final List<Map<String, dynamic>> poorBMI;

  PoorBMIPlanScreen(this.poorBMI);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poor BMI Workout Plan'),
      ),
      body: ListView.builder(
        itemCount: poorBMI.length,
        itemBuilder: (context, index) {
          final plan = poorBMI[index];
          final name = plan['name'];
          final days = plan['days'];

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: days.entries.map((day) {
                      final dayName = day.key;
                      final dayData = day.value;
                      final warmup = dayData['Warm-up'];
                      final workout = dayData['Workout'];
                      final coolDown = dayData['Cool-down'];

                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dayName,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text("Warm-up: $warmup"),
                              if (workout is List)
                                Column(
                                  children: workout.map((exercise) {
                                    return ListTile(
                                      leading: Icon(Icons.arrow_right, size: 30),
                                      title: Text(exercise),
                                      minLeadingWidth: 0,
                                    );
                                  }).toList(),
                                ),
                              if (workout is String) Text("Workout: $workout"),
                              SizedBox(height: 8),
                              Text("Cool-down: $coolDown"),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
