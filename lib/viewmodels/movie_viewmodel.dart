import 'package:flutter/cupertino.dart';

import '../data/models/movie_related/movie_model.dart';
import '../data/movie_infos/api/movie_web_service.dart';


class MovieViewModel extends ChangeNotifier {
  // popular movies
  List<Movie> _popularMovies = [];
  List<Movie> get  getPopularMovies => _popularMovies;
  Future<void> fetchPopularMovies() async {
    final results =  await MovieWebservice().fetchPopularMovies();
     _popularMovies = results;
    notifyListeners();
  }

  // top rated movies
  List<Movie> _topRatedMovies = [];
  List<Movie> get  getTopRatedMovies => _topRatedMovies;
  Future<void> fetchTopRatedMovies() async {
    final results =  await MovieWebservice().fetchTopRatedMovies();
    _topRatedMovies = results;
    notifyListeners();
  }

  // upcoming movies
  List<Movie> _upcomingMovies = [];
  List<Movie> get  getUpcomingMovies => _upcomingMovies;
  Future<void> fetchUpcomingMovies() async {
    final results =  await MovieWebservice().fetchUpcomingMovies();
    _upcomingMovies = results;
    notifyListeners();
  }
}