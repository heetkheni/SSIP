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
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ContainerWidget(days: 'Monday', index: widget.index, workPlan: widget.workPlan),
            ContainerWidget(days: 'Tuesday', index: widget.index, workPlan: widget.workPlan),
            ContainerWidget(days: 'Wednesday', index: widget.index, workPlan: widget.workPlan),
            ContainerWidget(days: 'Thursday', index: widget.index, workPlan: widget.workPlan),
            ContainerWidget(days: 'Friday', index: widget.index, workPlan: widget.workPlan),
            ContainerWidget(days: 'Saturday', index: widget.index, workPlan: widget.workPlan),
            ContainerWidget(days: 'Sunday', index: widget.index, workPlan: widget.workPlan),
          ],
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String days;
  final int index;
  final List<Map<String, dynamic>> workPlan;

  ContainerWidget({
    Key? key,
    required this.days,
    required this.index,
    required this.workPlan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            days,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          children: [
            Column(
              children: [
                Container(
                  height: 235,
                  child: Scrollbar(
                    // thumbVisibility: true,
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text(
                            days == 'Sunday' ? workPlan[index]['days'][days] : 'Warm-up: ${workPlan[index]['days'][days]['Warm-up'].toString()}',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            days == 'Sunday' ? '' : 'Workout: ${workPlan[index]['days'][days]['Workout'].toString()}',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ListTile(
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
              ],
            ),
          ],
        ),
      ],
    );
  }
}
