import "package:flutter/material.dart";
import 'package:fyp/Resources/auth_methods.dart';
import 'package:fyp/Resources/authentication_state.dart';
import 'package:fyp/Screens/Login/login_screen.dart';

import '../Screens/About/about_page.dart';
import '../Screens/Home/home_screen.dart';
import '../Screens/Setttings/settings_screen.dart';

Widget MyDrawerList(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(
      top: 15,
    ),
    child: Column(
      // shows the list of menu drawer
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.question_mark),
          title: Text("About"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AboutPage();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SettingsPage();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("LogOut"),
          onTap: () async {
            String res = await AuthMethods().loginOut();
            if (res == "Success") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LogInScreen();
                  },
                ),
              );
            }
          },
        ),
      ],
    ),
  );
}
