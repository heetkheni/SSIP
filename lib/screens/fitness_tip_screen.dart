import 'package:flutter/material.dart';
import 'package:arogya_mitra/data/fitnessTipData.dart';

class FitnessTipScreen extends StatefulWidget {
  const FitnessTipScreen({super.key});

  @override
  State<FitnessTipScreen> createState() => _FitnessTipScreenState();
}

class _FitnessTipScreenState extends State<FitnessTipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: fitnessTips.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(top: 16.0, left: 16, right: 16, bottom: 1),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fitnessTips[index].title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    fitnessTips[index].description,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
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
