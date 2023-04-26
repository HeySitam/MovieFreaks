import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/data/movie_infos/api/movie_web_service.dart';
import 'package:flutter_ui_practice/ui/themes/colors.dart';
import 'package:flutter_ui_practice/utils/utils.dart';
import 'package:flutter_ui_practice/viewmodels/movie_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../data/models/movie_related/movie_model.dart';
import '../widgets/movie_list_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MovieViewModel _vm;
  late AppColors appColors;

  @override
  void initState() {
    _vm = Provider.of<MovieViewModel>(context, listen: false);
    appColors = AppColors(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: appColors.background(),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 400, child: ColoredBox(color: Colors.redAccent)),
          PopularMovies(),
          Spacer(),
          TopRatedMovies(),
          Spacer(),
          UpcomingMovies(),
        ]),
      ),
    );
  }

  Widget PopularMovies() {
    _vm.fetchPopularMovies();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Movies",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: appColors.primary(), fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 200,
            child: Consumer<MovieViewModel>(
              builder: (context, vm, child) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.getPopularMovies.length ?? 0,
                    itemBuilder: (context, pos) {
                      final movie = vm.getPopularMovies[pos];
                      return MovieListItem(
                        imgUrl: "${Utils.baseImgUrl}${movie.posterPath}",
                        rating: movie.voteAverage,
                        votes: movie.voteCount,
                        heroTag: Random().nextDouble().toString(),
                        backDropPath: movie.backdropPath,
                        title: movie.title,
                        movieId: movie.id,
                        movieOverView: movie.overview,
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget TopRatedMovies() {
    _vm.fetchTopRatedMovies();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Rated Movies",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: appColors.primary(), fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 200,
            child: Consumer<MovieViewModel>(
              builder: (context, vm, child) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.getTopRatedMovies.length ?? 0,
                    itemBuilder: (context, pos) {
                      final movie = vm.getTopRatedMovies[pos];
                      return MovieListItem(
                        imgUrl: "${Utils.baseImgUrl}${movie.posterPath}",
                        rating: movie.voteAverage,
                        votes: movie.voteCount,
                        heroTag: Random().nextDouble().toString(),
                        backDropPath: movie.backdropPath,
                        title: movie.title,
                        movieId: movie.id,
                        movieOverView: movie.overview,
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget UpcomingMovies() {
    _vm.fetchUpcomingMovies();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming Movies",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: appColors.primary(), fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 200,
            child: Consumer<MovieViewModel>(
              builder: (context, vm, child) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.getUpcomingMovies.length ?? 0,
                    itemBuilder: (context, pos) {
                      final movie = vm.getUpcomingMovies[pos];
                      return MovieListItem(
                        imgUrl: "${Utils.baseImgUrl}${movie.posterPath}",
                        rating: movie.voteAverage,
                        votes: movie.voteCount,
                        heroTag: Random().nextDouble().toString(),
                        backDropPath: movie.backdropPath,
                        title: movie.title,
                        movieId: movie.id,
                        movieOverView: movie.overview,
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget Spacer() {
    return const SizedBox(height: 16);
  }
}
