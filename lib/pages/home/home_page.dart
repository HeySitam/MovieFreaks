import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/data/movie_infos/api/movie_web_service.dart';
import 'package:flutter_ui_practice/models/movie_related/popular_movie_model.dart';
import 'package:flutter_ui_practice/utils/utils.dart';
import 'package:flutter_ui_practice/viewmodels/movie_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PopularMoviesModel movies;

  @override
  void initState() {
    getPopularMovies();
    Provider.of<MovieViewModel>(context,listen: false).fetchPopularMovies();
    super.initState();
  }

  getPopularMovies() async {
    movies = await MovieWebservice().fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xFF03091c),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Movies",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 200,
              child: Consumer<MovieViewModel>(
                builder: (context, vm, child) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vm.getPopularMovies.results?.length ?? 0,
                      itemBuilder: (context, pos) {
                        return Card(
                            child: SizedBox(
                                width: 116,
                                height: 167,
                                child: Image.network(
                                    "${Utils.baseImgUrl}${vm.getPopularMovies.results?[pos].posterPath}",
                                     fit: BoxFit.cover,)),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
