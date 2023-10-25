// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_constructors, prefer_const_constructors, sort_child_properties_last, sort_child_properties_last

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      child: CarouselSlider(
        // options: CarouselOptions(aspectRatio: 1.2),
        options: CarouselOptions(
          height: 180,
          enlargeCenterPage: true,
          autoPlay: false,
          aspectRatio: 1 / 2,
          autoPlayCurve: Curves.linear,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          viewportFraction: 0.95,
        ),
        items: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imgURL1),
                        fit: BoxFit.cover,
                        opacity: 20),
                    borderRadius: BorderRadius.circular(15)),
                height: 600,
              ),
              Positioned(
                child: Column(
                  children: [
                    Text(
                      Name1,
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
                        image: NetworkImage(imgURL2),
                        fit: BoxFit.fill,
                        opacity: 20),
                    borderRadius: BorderRadius.circular(15)),
                height: 500,
              ),
              Positioned(
                child: Column(
                  children: [
                    Text(
                      Name2,
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
                        image: NetworkImage(imgURL3),
                        fit: BoxFit.cover,
                        opacity: 20),
                    borderRadius: BorderRadius.circular(15)),
                height: 500,
              ),
              Positioned(
                child: Column(
                  children: [
                    Text(
                      Name3,
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
    );
  }
}
