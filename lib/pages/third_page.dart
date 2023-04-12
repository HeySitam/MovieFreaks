import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/utils/routes.dart';

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Navigate"),
          onPressed: (){
            Navigator.popAndPushNamed(context, Routes.secondPageRoute);
          },
        ),
      ),
    );
  }
}