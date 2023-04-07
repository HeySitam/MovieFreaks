import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/pages/list_page.dart';
import 'package:flutter_ui_practice/providers/header_selection_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Grouped List Demo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: ChangeNotifierProvider(
          create: (_) => HeaderSelectionProvider(),
            child: GroupedListPage()
        )
    );
  }
}