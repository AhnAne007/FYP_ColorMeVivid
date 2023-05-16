import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Screens/About/about_page.dart';
import 'package:fyp/Screens/Designer/designer_body.dart';
import 'package:fyp/Screens/Setttings/settings_screen.dart';

import '../../components/drawer_header.dart';
import '../../components/drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Color Me vivid",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:Container(
        color: Colors.yellow[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 70,vertical: 0),
                child:
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: size.width - 60,
                        height: size.height * 0.45,
                        child: SvgPicture.asset(
                          "assets/icons/Home.svg",
                          // height: size.height * 0.45,
                          //width: 50,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.amberAccent,
                              //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DesignerScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Get Started".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.yellow[50],
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

//creating a drawerOptions
}
