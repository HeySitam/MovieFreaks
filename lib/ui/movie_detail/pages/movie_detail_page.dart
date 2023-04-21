import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/main.dart';
import 'package:flutter_ui_practice/ui/movie_detail/widgets/similar_movies_list.dart';
import 'package:flutter_ui_practice/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/movie_detail_viewmodel.dart';
import '../widgets/backdrop_poster_widget.dart';
import '../widgets/cast_list_widget.dart';
import '../widgets/crew_list_widget.dart';
import '../widgets/movie_basic_infos_widget.dart';
import '../widgets/movie_overview_widget.dart';
import '../widgets/section_divider_widget.dart';
import '../widgets/video_list_widget.dart';
import '../widgets/watch_trailer_button_widget.dart';

class MovieDetailPage extends StatefulWidget {
  final movieId;
  final backDropPath;
  final heroTag;
  final movieTitle;
  final movieOverview;

  MovieDetailPage(
      {required this.movieId, this.backDropPath, this.heroTag, this.movieTitle,this.movieOverview});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> with RouteAware{

  final overView =
      "Armed with the astonishing ability to shrink in scale but increase in strength, master thief Scott Lang must embrace his inner-hero and help his mentor, Doctor Hank Pym, protect the secret behind his spectacular Ant-Man suit from a new generation of towering threats. Against seemingly insurmountable obstacles, Pym and Lang must plan and pull off a heist that will save the world.";
  bool _isOverviewExpanded = false;
  late MovieDetailViewModel _vm;

  @override
  void initState() {
    Provider.of<MovieDetailViewModel>(context,listen: false).fetchSimilarMovies(widget.movieId);
    Provider.of<MovieDetailViewModel>(context, listen: false).fetchFromCastCrewApi(widget.movieId);
    Provider.of<MovieDetailViewModel>(context, listen: false).fetchVideoInfos(widget.movieId);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  void didPopNext() {
    Provider.of<MovieDetailViewModel>(context, listen: false).fetchFromCastCrewApi(widget.movieId);
    Provider.of<MovieDetailViewModel>(context,listen: false).fetchSimilarMovies(widget.movieId);
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    var imgUrl = "${Utils.baseImgUrl}${widget.backDropPath}";
    print(imgUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.movieTitle}",
          style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500
          ),),
        backgroundColor: Utils.background_color,

      ),
      body: SingleChildScrollView(
        child: ColoredBox(
          color: Utils.background_color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // DetailPageHeader(movieTitle: widget.movieTitle ?? "Movie Title"),
              BackDropPosterWidget(imgUrl: imgUrl, context: context, heroTag: widget.heroTag),
              //_WatchTrailerButton(),
              Consumer<MovieDetailViewModel>(
                  builder:(context, vm, child) {
                    return MovieBasicInfoWidget(detail: vm.getCastCrewWithDetail);
                  }
              ),
              MovieOverviewWidget(movieOverview: widget.movieOverview),
              _WishListAndShare(),
              const SectionDividerWidget(),
              Consumer<MovieDetailViewModel>(
                  builder:(context, vm, child) => CastListWidget(detail: vm.getCastCrewWithDetail)
        ),
              const SectionDividerWidget(),
              Consumer<MovieDetailViewModel>(
                  builder:(context, vm, child) => CrewListWidget(detail: vm.getCastCrewWithDetail)
              ),
              const SectionDividerWidget(),
              VideoListWidget(backDropPath: widget.backDropPath,),
              const SectionDividerWidget(),
              const SimilarMoviesList(),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }

  Widget _WishListAndShare() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Column(
            children: const [
              Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "Wishlist",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 32,
          ),
          Column(
            children: const [
              Icon(
                Icons.share,
                color: Colors.white,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "Share",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _WatchTrailerButton() {
    return InkWell(
      onTap: () {
        print("Watch Trailer");
      },
      child: const WatchTrailerButtonWidget(),
    );
  }
}

