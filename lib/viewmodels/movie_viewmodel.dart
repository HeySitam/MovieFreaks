import 'package:flutter/cupertino.dart';

import '../data/movie_infos/api/movie_web_service.dart';
import '../models/movie_related/popular_movie_model.dart';

class MovieViewModel extends ChangeNotifier {
  PopularMoviesModel _popularMovies = PopularMoviesModel();
  PopularMoviesModel get  getPopularMovies => _popularMovies;
  Future<void> fetchPopularMovies() async {
    final results =  await MovieWebservice().fetchPopularMovies();
     _popularMovies = results;
     print("viewmodel result is $_popularMovies");
    notifyListeners();
  }
}