// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 232, 246, 255),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.blue,
              size: 25,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black, width: 2),
            )),
        onChanged: (value) {
          print('Searching for: $value');
        },
      ),
    );
  }
}
