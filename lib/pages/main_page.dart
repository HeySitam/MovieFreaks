import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(
            color: Colors.white60
          )),
          color: Color(0xFF03091c)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: GNav(
              gap: 8,
              backgroundColor: Color(0xFF03091c),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.blueGrey,
              tabs: [
            GButton(
              icon: Icons.home_filled,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.person_2_outlined,
              text: "Profile",
            ),
          ]),
        ),
      ),
    );
  }
}
