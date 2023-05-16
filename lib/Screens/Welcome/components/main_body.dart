import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Screens/Login/login_screen.dart';
import 'package:fyp/Screens/Signup/signup_screen.dart';
import "package:fyp/Screens/Welcome/components/background.dart";

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome to Color Me Vivid",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic),
          ),
          Container(
            width: size.width - 60,
            height: size.height * 0.45,
            child: SvgPicture.asset(
              "assets/icons/palette.svg",
              // height: size.height * 0.45,
              //width: 50,
            ),
          ),

          //Login Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.yellowAccent[700],
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LogInScreen();
                    },
                  ),
                );
              },
              child: Text(
                "Login".toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          //Sign Up Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[100],
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
              child: Text(
                "Sign Up".toUpperCase(),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
