import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/pages/first_page.dart';
import 'package:flutter_ui_practice/pages/second_page.dart';
import 'package:flutter_ui_practice/pages/third_page.dart';
import 'package:flutter_ui_practice/utils/routes.dart';

void main() => runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Grouped List Demo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        initialRoute: '/',
        routes: {
          '/' : (context) => FirstPage(),
          Routes.firstPageRoute : (context) => FirstPage(),
          Routes.secondPageRoute : (context) => SecondPage(),
          Routes.thirdPageRoute : (context) => ThirdPage()
        },
    );
  }
}