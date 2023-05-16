import 'package:flutter/material.dart';

class AboutPageTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment(0, 0.90),
      color: Colors.yellow[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/sofa.png",
            height: 120,
          ),
          SizedBox(height: 10,),
          Text(
            "Place Furniture",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Furnish your space, your way with our app",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
