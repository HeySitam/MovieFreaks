import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/ui/main_page.dart';
import 'package:flutter_ui_practice/utils/routes.dart';
import 'package:flutter_ui_practice/viewmodels/movie_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movie App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        initialRoute: '/',
        routes: {
          '/' : (context) => ChangeNotifierProvider(
              create: (context) => MovieViewModel(),
              child: MainPage()),
        },
    );
  }
}