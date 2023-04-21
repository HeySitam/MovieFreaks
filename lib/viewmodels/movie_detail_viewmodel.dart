import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/data/models/movie_related/cast_crew_model.dart';
import 'package:flutter_ui_practice/data/models/movie_related/corresponding_video.dart';

import '../data/models/movie_related/movie_model.dart';
import '../data/movie_infos/api/movie_web_service.dart';

class MovieDetailViewModel extends ChangeNotifier{
  CastCrewWithMovieDetails? _castCrewWithDetails;
  CastCrewWithMovieDetails? get  getCastCrewWithDetail => _castCrewWithDetails;

  Future<void> fetchFromCastCrewApi(int movieId) async {
    print("Func called");
    final results =  await MovieWebservice().fetchFromCastCrewApi(movieId);
    print(results);
    _castCrewWithDetails = results;
    notifyListeners();
  }

  // similar movies
  List<Movie> _similarMovies = [];
  List<Movie> get  getSimilarMovies => _similarMovies;
  Future<void> fetchSimilarMovies(int movieId) async {
    final results =  await MovieWebservice().fetchSimilarMovies(movieId);
    _similarMovies = results;
    notifyListeners();
  }

  // similar movies
  List<VideoInfo> _videoInfos = [];
  List<VideoInfo> get  getVideoInfos => _videoInfos;
  Future<void> fetchVideoInfos(int movieId) async {
    final results =  await MovieWebservice().fetchCorrespondingVideos(movieId);
    _videoInfos = results;
    notifyListeners();
  }
}