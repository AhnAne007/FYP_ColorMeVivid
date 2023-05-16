import 'package:flutter/material.dart';

import '../../components/drawer_header.dart';
import '../../components/drawer_menu.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Color Me vivid",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 70,vertical: 0),
                child:
                Center(
                  child: Text("Hellow from Settings",
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
}