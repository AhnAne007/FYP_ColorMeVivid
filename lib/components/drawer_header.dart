import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Text(
            "Welcome",
            style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 35,
                fontStyle: FontStyle.italic),
          ),
          Text(
            "Color-Me-Vivid",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/lamp.png",
                height: 90,
              ),
              SizedBox(width: 70,),
              SizedBox(width: 50,),
              Image.asset(
                "assets/images/w_sofa.png",
                height: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
