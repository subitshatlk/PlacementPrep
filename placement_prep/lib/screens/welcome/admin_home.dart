import 'package:flutter/material.dart';
import 'package:placement_prep/screens/welcome.dart';
import 'package:placement_prep/utilities/constants.dart';
//import '../add_event.dart';
import '../home_screen.dart';
import '../welcome.dart';
//import 'admin_profile.dart';
//import 'add_data.dart';
import 'admin_technology.dart';
import 'alertpage.dart';
import 'display_data.dart';
import 'navigate.dart';
import 'alumniform.dart';
import 'technology.dart';

class AdminHome extends StatefulWidget {
  @override
  AdminHomeState createState() => new AdminHomeState();
}

class AdminHomeState extends State<AdminHome> {
  int currentIndex = 0;

  final List<Widget> viewContainer = [
    SubPage(),
    AlertPage(),
    Alumniform(),
    Technologyform(),

  ];

  @override
  Widget build(BuildContext context) {

    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return new Scaffold(
      appBar: AppBar(
       title:  Text("Admin"),
        actions: <Widget>[

          new IconButton(
              icon: new Icon(Icons.more_vert), onPressed: () {
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Welcome()),
            );*/
          })
        ],
      ),
      body: viewContainer[currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: currentIndex,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon:new Icon(Icons.add_box_outlined),
              title: Text("Add Data"),
            ),
            BottomNavigationBarItem(
              icon:new Icon(Icons.logout),
              title: Text("Logout"),
            ),
            BottomNavigationBarItem(
              icon:new Icon(Icons.my_library_books),
              title: Text("Add Review"),
            ),
            BottomNavigationBarItem(
              icon:new Icon(Icons.recommend),
              title: Text("Add Latest Technologies"),
            ),

          ]),
    );
    // TODO: implement build


  }
}




