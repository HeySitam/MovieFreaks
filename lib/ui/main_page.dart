import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/ui/profile/profile_page.dart';
import 'package:flutter_ui_practice/ui/search/search_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home/pages/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoadPage(selectedIdx),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white60)),
            color: Color(0xFF03091c)),
        child:  Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: GNav(
              gap: 8,
              backgroundColor: Color(0xFF03091c),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.blueGrey,
              onTabChange: (idx){
                setState(() {
                  selectedIdx = idx;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  text: "Home",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                GButton(
                  icon: Icons.search,
                  text: "Search",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                GButton(
                  icon: Icons.person,
                  text: "Profile",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ]),
        ),
      ),
    );
  }
  Widget _LoadPage(int idx){
    if(idx == 0){
      return HomePage();
    } else if(idx == 1){
      return SearchPage();
    } else {
      return ProfilePage();
    }
  }
}
