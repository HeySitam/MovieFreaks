import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/data/movie_infos/api/movie_web_service.dart';
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
  @override
  void initState() {
   _vm = Provider.of<MovieViewModel>(context,listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xFF03091c),
      child: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(
                height: 400,
                  child: ColoredBox(color: Colors.redAccent)),
                 PopularMovies(),
                 Spacer(),
                 TopRatedMovies(),
                 Spacer(),
                 UpcomingMovies(),
            ]
        ),
      ),
    );
  }

  Widget PopularMovies(){
    _vm.fetchPopularMovies();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Popular Movies",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
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
                      final posterPath = vm.getPopularMovies[pos].posterPath;
                      return MovieListItem(imgUrl: "${Utils.baseImgUrl}$posterPath");
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget TopRatedMovies(){
    _vm.fetchTopRatedMovies();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Rated Movies",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
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
                      final posterPath = vm.getTopRatedMovies[pos].posterPath;
                      return MovieListItem(imgUrl: "${Utils.baseImgUrl}$posterPath");
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget UpcomingMovies(){
    _vm.fetchUpcomingMovies();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upcoming Movies",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
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
                      final posterPath = vm.getUpcomingMovies[pos].posterPath;
                      return MovieListItem(imgUrl: "${Utils.baseImgUrl}$posterPath");
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget Spacer(){
    return const SizedBox(height: 16);
  }
}
