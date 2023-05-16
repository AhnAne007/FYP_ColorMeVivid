import 'package:flutter/material.dart';

class AboutPageThree extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment(0, 0.90),
      color: Colors.yellow[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/palette.png",
            height: 150,
          ),
          SizedBox(height: 10,),
          Text(
            "Visualize Paint",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: Text(
              "Experience the convenience of virtual painting with our app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
