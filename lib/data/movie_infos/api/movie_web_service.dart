import 'package:dio/dio.dart';
import 'package:flutter_ui_practice/models/movie_related/popular_movie_model.dart';
import 'package:flutter_ui_practice/utils/utils.dart';

class MovieWebservice {
  final dio = Dio();
  Future<PopularMoviesModel> fetchPopularMovies() async {
    const url = "${Utils.baseUrl}movie/popular?api_key=4ec53f3b9ac13226645942eca37f3df0&language=en&page=1";
    final response = await dio.get(url);
    if(response.statusCode == 200) {
      print("response is ${response.data}");
      final body = response.data;
      return PopularMoviesModel.fromJson(body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}