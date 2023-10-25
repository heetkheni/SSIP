// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 232, 246, 255),
      height: 50,
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: Theme.of(context).textTheme.headline2!.copyWith(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.blue,
              size: 26,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
        onChanged: (value) {
          print('Searching for: $value');
        },
      ),
    );
  }
}
