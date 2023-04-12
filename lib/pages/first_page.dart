import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/pages/second_page.dart';
import 'package:flutter_ui_practice/utils/routes.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Navigate"),
          onPressed: (){
           // Navigator.pushNamedAndRemoveUntil(context, Routes.secondPageRoute, ModalRoute.withName(Routes.firstPageRoute));
            Navigator.pushNamed(context, Routes.secondPageRoute);
          },
        ),
      ),
    );
  }
}