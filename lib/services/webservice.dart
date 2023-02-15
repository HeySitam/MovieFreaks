import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/movie_model.dart';
import 'package:http/http.dart' as http;

class Webservice {
  final dio = Dio();
  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538";
   // final response = await http.get(Uri.parse(url));
    final response = await dio.get(url);
    if(response.statusCode == 200) {
      print("response is ${response.data}");
      //final body = jsonDecode(response.body);
      final body = response.data;
      final Iterable json = body["Search"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}