import 'package:flutter/material.dart';

class CommonRowWidget extends StatelessWidget {
    CommonRowWidget({super.key , required this.text , required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
          Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black,fontSize: 18),),
          TextButton(onPressed: onTap, child: Text("See all",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: Color(0xFF0856DE)),))
    
        ],
      ),
    );
  }
}