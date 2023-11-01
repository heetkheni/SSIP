// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_constructors, prefer_const_constructors, sort_child_properties_last, sort_child_properties_last

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final String imgURL1;
  final String imgURL2;
  final String imgURL3;
  final String Name1;
  final String Name2;
  final String Name3;

  Carousel({
    Key? key,
    required this.imgURL1,
    required this.imgURL2,
    required this.imgURL3,
    required this.Name1,
    required this.Name2,
    required this.Name3,
  }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 220,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 1 / 2,
              autoPlayCurve: Curves.linear,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              viewportFraction: 0.95,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.imgURL1),
                            fit: BoxFit.cover,
                            opacity: 20),
                        borderRadius: BorderRadius.circular(15)),
                    height: 600,
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        Text(
                          widget.Name1,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    top: 150,
                    left: 10,
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.imgURL2),
                            fit: BoxFit.fill,
                            opacity: 20),
                        borderRadius: BorderRadius.circular(15)),
                    height: 500,
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        Text(
                          widget.Name2,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    top: 150,
                    left: 10,
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.imgURL3),
                            fit: BoxFit.cover,
                            opacity: 20),
                        borderRadius: BorderRadius.circular(15)),
                    height: 500,
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        Text(
                          widget.Name3,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    top: 150,
                    left: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == i
                      ? Colors.blue
                      : Colors.grey, // Adjust colors as needed
                ),
              ),
          ],
        ),
      ],
    );
  }
}
