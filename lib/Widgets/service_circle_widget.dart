import 'package:flutter/material.dart';

class ServiceCircleWidget extends StatelessWidget {
  ServiceCircleWidget(
      {super.key,
      required this.radius,
      required this.onTap,
      required this.text,
      required this.imgUrl});

  final int radius;
  VoidCallback onTap;
  final String text;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.red,
      child: Column(
        children: [
          Container(
            child: CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: kheight * 0.003,
          ),
          Text(
            text,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}
