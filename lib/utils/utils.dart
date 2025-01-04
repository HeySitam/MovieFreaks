import 'package:flutter/material.dart';

class Utils{
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const baseImgUrl = "http://image.tmdb.org/t/p/w500";
  static const api_key = "add_your_api_key";
  static const background_color = Color(0xFF03091c);
  static String baseYoutubeUrl = "https://www.youtube.com/watch?v=";
}

class UiUtils{
  static Widget horizontalGap(double value){
    return SizedBox(width: value);
  }

  static Widget verticaGap(double value){
    return SizedBox(height: value);
  }
}
