import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_practice/data/models/movie_related/cast_crew_model.dart';
import 'package:flutter_ui_practice/main.dart';
import 'package:flutter_ui_practice/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/movie_detail_viewmodel.dart';
import '../../../viewmodels/movie_viewmodel.dart';
import '../../home/widgets/movie_list_item.dart';

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
  final genereList = ["Comedy", "Horror"];

  final overView =
      "Armed with the astonishing ability to shrink in scale but increase in strength, master thief Scott Lang must embrace his inner-hero and help his mentor, Doctor Hank Pym, protect the secret behind his spectacular Ant-Man suit from a new generation of towering threats. Against seemingly insurmountable obstacles, Pym and Lang must plan and pull off a heist that will save the world.";
  bool _isOverviewExpanded = false;
  late MovieDetailViewModel _vm;

  @override
  void initState() {
    Provider.of<MovieDetailViewModel>(context, listen: false).fetchFromCastCrewApi(widget.movieId);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  void didPopNext() {
    Provider.of<MovieDetailViewModel>(context, listen: false).fetchFromCastCrewApi(widget.movieId);
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    var imgUrl = "${Utils.baseImgUrl}${widget.backDropPath}";
    print(imgUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.movieTitle}",
          style: TextStyle(
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
              BackDropPoster(imgUrl, context),
              WatchTrailerButton(),
              MovieBasicInfos(),
              MovieOverview(),
              WishListAndShare(),
              SectionDivider(),
              Consumer<MovieDetailViewModel>(
                  builder:(context, vm, child) => CastList(vm.getCastCrewWithDetail)
        ),
              SectionDivider(),
              Consumer<MovieDetailViewModel>(
                  builder:(context, vm, child) => CrewList(vm.getCastCrewWithDetail)
              ),
              SectionDivider(),
              TopRatedMovies(),
              SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }

  Widget TopRatedMovies() {
    Provider.of<MovieViewModel>(context,listen: false).fetchTopRatedMovies();
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left:16),
            child:  Text(
              "Get here similar",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
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

  Widget CastList(CastCrewWithMovieDetails? detail){
    final castList = detail?.credits?.cast;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 8),
          child: Text(
            "Cast",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 16,),
        SizedBox(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: castList?.length ?? 0,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                width: 120,
                child: Column(children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage:
                    NetworkImage("${Utils.baseImgUrl}${castList?[index].profilePath ?? "/null"}"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${castList?[index].name}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "as ${castList?[index].character}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.white60,
                        fontWeight: FontWeight.w400),
                  ),
                ]),
              )),
        )
      ],
    );
  }

  Widget CrewList(CastCrewWithMovieDetails? detail){
    final crewList = detail?.credits?.crew;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 8),
          child: Text(
            "Crew",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 16,),
        SizedBox(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: crewList?.length ?? 0,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                width: 120,
                child: Column(children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage:
                    NetworkImage("${Utils.baseImgUrl}${crewList?[index].profilePath ?? "/null"}"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${crewList?[index].name}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "${crewList?[index].job}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white60,
                        fontWeight: FontWeight.w400),
                  ),
                ]),
              )),
        )
      ],
    );
  }

  Widget WishListAndShare() {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Row(
        children: [
          SizedBox(
            width: 16,
          ),
          Column(
            children: [
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
          SizedBox(
            width: 32,
          ),
          Column(
            children: [
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

  Widget SectionDivider() {
    return Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        child: Divider(
          color: Colors.white30,
        ));
  }

  Widget MovieOverview() {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 32, top: 16),
        child: GestureDetector(
            onTap: () {
              _isOverviewExpanded = !_isOverviewExpanded;
              setState(() {});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  maxLines: _isOverviewExpanded ? null : 2,
                  overflow: TextOverflow.fade,
                  text: TextSpan(
                    text: widget.movieOverview,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '...less',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.pinkAccent)),
                    ],
                  ),
                ),
                Visibility(
                  visible: !_isOverviewExpanded,
                  child: Text('...more',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.pinkAccent)),
                ),
              ],
            )),
      ),
    );
  }

  Widget MovieBasicInfos() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        "2h 25m • Action, Drama, Thriller • 30 Mar,2023",
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget BackDropPoster(String imgUrl, BuildContext context) {
    return Hero(
      tag: widget.heroTag,
      child: Image.network(imgUrl,
          height: 250,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      }),
    );
  }

  Widget WatchTrailerButton() {
    return InkWell(
      onTap: () {
        print("Watch Trailer");
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_arrow),
            Text(
              "Watch Trailers",
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
