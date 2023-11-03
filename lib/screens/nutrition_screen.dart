// import 'package:flutter/material.dart';
// import 'package:arogya_mitra/data/nutritionData.dart';

// class NutritionScreen extends StatefulWidget {
//   const NutritionScreen({super.key});

//   @override
//   State<NutritionScreen> createState() => _NutritionScreenState();
// }

// class _NutritionScreenState extends State<NutritionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nutrition Plan'),
//       ),
//       body: ListView(
//         children: nutritionPlan.map((data) {
//           return NutritionDayTile(data: data);
//         }).toList(),
//       ),
//     );
//   }
// }

// class NutritionDayTile extends StatefulWidget {
//   final Map<String, String> data;

//   NutritionDayTile({required this.data});

//   @override
//   _NutritionDayTileState createState() => _NutritionDayTileState();
// }

// class _NutritionDayTileState extends State<NutritionDayTile> {
//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 4),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(25.0),
//         child: Card(
          
//           shape: RoundedRectangleBorder(
//             borderRadius:
//                 BorderRadius.circular(15.0), // Adjust the radius as needed
//           ),
//           elevation: 1,
//           child: ExpansionTile(
//             title: Text(
//               '${widget.data['day']}',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
            
//             collapsedTextColor: Colors.black,
//             children: [
//               MealCategory(data: widget.data, category: 'Breakfast'),
//               MealCategory(data: widget.data, category: 'Lunch'),
//               MealCategory(data: widget.data, category: 'Snack'),
//               MealCategory(data: widget.data, category: 'Dinner'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MealCategory extends StatelessWidget {
//   final Map<String, String> data;
//   final String category;

//   MealCategory({required this.data, required this.category});

  

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '${category}:',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(data[category.toLowerCase()] ?? 'Not specified'),
//           ],
//         ),
//       ),
//     );
//   }
// }


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
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 1,
          child: ExpansionTile(
            title: Text(
              '${widget.data['day']}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
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
    IconData selectedIcon;

    // Determine the icon and color based on the category
    if (category == 'Breakfast') {
      selectedIcon = Icons.free_breakfast;  
    } else if (category == 'Lunch') {
      selectedIcon = Icons.restaurant;
    } else if (category == 'Dinner') {
      selectedIcon = Icons.dinner_dining; 
    } else if (category == 'Snack') {
      selectedIcon = Icons.local_dining;
    }
    selectedIcon = Icons.error;

    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  selectedIcon ,
                  size: 20.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  '$category:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(data[category.toLowerCase()] ?? 'Not specified'),
          ],
        ),
      ),
    );
  }
}
