import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/ui/movie_detail/pages/play_video_page.dart';

import '../ui/main_page.dart';

class Routes{
  static const movieDetailPageRoute = "/movieDetailPage";
  static const mainPageRoute = "/mainPage";
  static const playVideoPageRoute = "/playVideoPage";

  static Route<dynamic>? onGenerateCustomRoute(RouteSettings? settings){
       switch(settings!.name){
         case mainPageRoute:
           return MaterialPageRoute(builder: (context) => MainPage());
         case playVideoPageRoute:
           final Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
           return  MaterialPageRoute(builder: (context) => PlayVideoPage(videoId: arguments['videoId'],));
       }
  }
}