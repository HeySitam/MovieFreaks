import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/ui/movie_detail/pages/movie_detail_page.dart';
import 'package:flutter_ui_practice/utils/routes.dart';
import 'package:flutter_ui_practice/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/movie_detail_viewmodel.dart';

class MovieListItem extends StatelessWidget {
  final imgUrl;
  final rating;
  final votes;
  final heroTag;
  String? backDropPath;
  final movieId;
  String? title;
  final movieOverView;
  final _itemH = 167.0;
  final _itemW = 120.0;

  MovieListItem({required this.imgUrl,
    required this.rating,
    required this.votes,
    required this.heroTag,
    required this.movieId,
    required this.movieOverView,
    this.backDropPath,
    this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: InkWell(
                onTap: () {
                  print("shared argument is $heroTag");
                  // Navigator.pushNamed(context, Routes.movieDetailPageRoute, arguments: heroTag);
                  Utils.dummyCheck = heroTag;
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          pageBuilder: (_, __, ___) =>
                              MovieDetailPage(
                                heroTag: heroTag,
                                backDropPath: backDropPath,
                                movieTitle: title,
                                movieId: movieId,
                                movieOverview: movieOverView,
                              )));
                },
                child: Hero(
                  tag: heroTag,
                  child: Image.network(
                    imgUrl,
                    width: _itemW,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2, bottom: 2),
            child: Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  size: 16,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "$rating/10",
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "$votes votes",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
