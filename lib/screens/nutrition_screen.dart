import 'package:flutter/material.dart';
import 'package:arogya_mitra/data/nutritionData.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition Plan'),
      ),
      body: ListView(
        children: nutritionPlan.map((data) {
          return NutritionDayTile(data: data);
        }).toList(),
      ),
    );
  }
}

class NutritionDayTile extends StatefulWidget {
  final Map<String, String> data;

  NutritionDayTile({required this.data});

  @override
  _NutritionDayTileState createState() => _NutritionDayTileState();
}

class _NutritionDayTileState extends State<NutritionDayTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Card(
          color: Colors.blue[200],
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the radius as needed
          ),
          elevation: 2,
          child: ExpansionTile(
            title: Text(
              '${widget.data['day']}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            backgroundColor: Colors.blue[100],
            collapsedTextColor: Colors.black,
            children: [
              MealCategory(data: widget.data, category: 'Breakfast'),
              MealCategory(data: widget.data, category: 'Lunch'),
              MealCategory(data: widget.data, category: 'Snack'),
              MealCategory(data: widget.data, category: 'Dinner'),
            ],
          ),
        ),
      ),
    );
  }
}

class MealCategory extends StatelessWidget {
  final Map<String, String> data;
  final String category;

  MealCategory({required this.data, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${category}:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(data[category.toLowerCase()] ?? 'Not specified'),
        ],
      ),
    );
  }
}
