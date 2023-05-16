import 'package:flutter/material.dart';

class AboutPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment(0, 0.90),
      color: Colors.yellow[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/360.png",
            height: 150,
          ),
          SizedBox(height: 10,),
          Text(
            "Capture Image",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Elevate your home's aesthetic with camera",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
