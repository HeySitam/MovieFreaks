import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/utils.dart';
import '../../../viewmodels/movie_detail_viewmodel.dart';
import '../../home/widgets/movie_list_item.dart';

class SimilarMoviesList extends StatelessWidget{
  const SimilarMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.only(left:16),
            child:  Text(
              "Get here similar",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 200,
            child: Consumer<MovieDetailViewModel>(
              builder: (context, vm, child) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.getSimilarMovies.length ?? 0,
                    itemBuilder: (context, pos) {
                      final movie = vm.getSimilarMovies[pos];
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

}