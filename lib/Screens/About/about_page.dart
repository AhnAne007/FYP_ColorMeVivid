import 'package:flutter/material.dart';
import 'package:fyp/Screens/About/components/about_page_one.dart';
import 'package:fyp/Screens/About/components/about_page_three.dart';
import 'package:fyp/Screens/About/components/about_page_two.dart';
import 'package:fyp/Screens/Setttings/settings_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/drawer_header.dart';
import '../../components/drawer_menu.dart';
import '../Home/home_screen.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  //making a controller to see what page we are on
  PageController _controller = PageController();

  //track of last page
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amberAccent,
      //   title: Text("Color Me vivid",style: TextStyle(color: Colors.black),),
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      // body:Container(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Container(
      //         // margin: EdgeInsets.symmetric(horizontal: 70,vertical: 0),
      //           child:
      //           Center(
      //             child: Text("Hellow from About",
      //             ),
      //           )
      //       ),
      //     ],
      //   ),
      // ),
      // drawer: Drawer(
      //   backgroundColor: Colors.yellow[50],
      //   child: SingleChildScrollView(
      //     child: Container(
      //       child: Column(
      //         children: [
      //           MyHeaderDrawer(),
      //           MyDrawerList(context),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: <Widget>[
              AboutPageOne(),
              AboutPageTwo(),
              AboutPageThree(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.90),
              //color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Text("Skip"),
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                        spacing: 8.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.black,
                        activeDotColor: Colors.black),
                  ),
                  isLastPage
                      ? GestureDetector(
                          child: TextButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: Colors.white,
                                  ),
                                ))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomeScreen();
                                  },
                                ),
                              );
                            },
                            child: Text("Done"),
                          ),
                          onTap: () {},
                        )
                      : GestureDetector(
                          child: TextButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: Colors.white,
                                  ),
                                ))),
                            onPressed: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Text("Next"),
                          ),
                          onTap: () {},
                        ),
                  //Container()
                ],
              ))
        ],
      ),
    );
  }
//creating a drawerOptions

}
