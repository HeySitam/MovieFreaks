import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/data/models/movie_related/cast_crew_model.dart';

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
}