import 'package:dio/dio.dart';
import 'package:flutter_ui_practice/utils/utils.dart';

import '../../models/movie_related/cast_crew_model.dart';
import '../../models/movie_related/movie_model.dart';

class MovieWebservice {
  final _dio = Dio();

  Future<List<Movie>> fetchPopularMovies() async {
    const url =
        "${Utils.baseUrl}movie/popular?api_key=4ec53f3b9ac13226645942eca37f3df0&language=en&page=1";
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      final body = response.data;
      Iterable json = body['results'];

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<Movie>> fetchTopRatedMovies() async {
    const url =
        "${Utils.baseUrl}movie/top_rated?api_key=4ec53f3b9ac13226645942eca37f3df0&language=en&page=1";
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      final body = response.data;
      Iterable json = body['results'];

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<Movie>> fetchUpcomingMovies() async {
    const url =
        "${Utils.baseUrl}movie/upcoming?api_key=4ec53f3b9ac13226645942eca37f3df0&language=en&page=1";
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      final body = response.data;
      Iterable json = body['results'];

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<CastCrewWithMovieDetails> fetchFromCastCrewApi(int movieId) async {
    final String url =
        "${Utils.baseUrl}movie/$movieId?api_key=4ec53f3b9ac13226645942eca37f3df0&append_to_response=credits";
    print(url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      final body = response.data;
      print(body);
      return CastCrewWithMovieDetails.fromJson(body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
