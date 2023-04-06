import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/providers/count_down_provider.dart';
import 'package:flutter_ui_practice/providers/count_up_provider.dart';
import 'package:flutter_ui_practice/ui/pages/dummy_checking_page.dart';
import 'package:flutter_ui_practice/ui/pages/movie_list_page.dart';
import 'package:flutter_ui_practice/viewmodels/movie_list_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies MVVM Example",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MovieListViewModel()),
            ChangeNotifierProvider(create: (_) => CountUpProvider()),
            ChangeNotifierProvider(create: (_) => CountDownProvider()),
          ],
          child: DummyCheckingPage(),
        )
        // ChangeNotifierProvider(
        //   create: (context) => MovieListViewModel(),
        //   child: DummyCheckingPage(),
        // )
    );
  }
}