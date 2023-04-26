import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/ui/main_page.dart';
import 'package:flutter_ui_practice/ui/themes/app_theme.dart';
import 'package:flutter_ui_practice/utils/routes.dart';
import 'package:flutter_ui_practice/viewmodels/movie_detail_viewmodel.dart';
import 'package:flutter_ui_practice/viewmodels/movie_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MovieViewModel()),
          ChangeNotifierProvider(create: (context) => MovieDetailViewModel())
        ],
        // child: MainPage()
        child: App()));

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie App",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.dayTheme,
      darkTheme: AppTheme.nightTheme,
      home: MainPage(),
      onGenerateRoute: (settings) {
        return Routes.onGenerateCustomRoute(settings);
      },
      navigatorObservers: [routeObserver],
    );
  }
}
