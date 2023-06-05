import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../data/models/movie_related/movie_model.dart';
import '../../../viewmodels/movie_viewmodel.dart';
import '../../themes/colors.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late AppColors appColors;
  int recentSearchListLen = 5;
  int popularSearchListLen = 10;
  bool isTyping = false;
  bool isSearchBarTapped = false;
  final TextEditingController _searchBarController = TextEditingController();
  static const double ITEM_HEIGHT = 62.0;

  @override
  void initState() {
    appColors = AppColors(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: appColors.background(),
        child: Column(
          children: [
            SearchBar(),
            Expanded(
              child: SingleChildScrollView(
                child: isTyping ? SomethingTypedScreenBody() : NothingTypedScreenBody(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget NothingTypedScreenBody() {
    return Column(
      children: [
        SearchTopicHeading(
            headingText: "RECENT SEARCHES",
            iconData: Icons.access_time_outlined),
        MovieList(),
        SearchTopicHeading(
            headingText: "POPULAR SEARCHES",
            iconData: Icons.data_thresholding_outlined),
        MovieList(),
        UiUtils.verticaGap(16)
      ],
    );
  }

  Widget SomethingTypedScreenBody() {
    return Column(
      children: [
        SearchTopicHeading(
            iconData: Icons.movie_creation_outlined,
            headingText: "RELEVANT MOVIES"),
        MovieList()
      ],
    );
  }

  Widget NothingFoundScreenBody() {
    return Container();
  }

  // Widget RecentSearchList() {
  //   _vm.fetchPopularMovies();
  //   return SizedBox(
  //     height: ITEM_HEIGHT * recentSearchListLen,
  //     child: ListView.builder(
  //         padding: EdgeInsets.zero,
  //         physics: NeverScrollableScrollPhysics(),
  //         scrollDirection: Axis.vertical,
  //         itemCount: recentSearchListLen,
  //         itemBuilder: (buildContext, idx) {
  //           return MovieListItem(iconData: Icons.cancel_outlined);
  //         }),
  //   );
  // }

  Widget MovieList() {
    Provider.of<MovieViewModel>(context,listen: false).fetchPopularMovies();
    return Consumer<MovieViewModel>(
          builder :(buildContext, viewModel, widget) {
            List<Movie> movieList = viewModel.getPopularMovies;
            popularSearchListLen = movieList.length;
            return SizedBox(
              height: ITEM_HEIGHT * popularSearchListLen,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: popularSearchListLen,
                  itemBuilder: (buildContext, idx) {
                    Movie item = movieList[idx];
                    return MovieListItem(iconData: Icons.navigate_next,movie: item);
                  }),
            );
          }
      );
  }

  Widget MovieListItem({required IconData iconData, required Movie movie}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
      child: InkWell(
        onTap: (){
          print("Item Clicked");
        },
        child: Row(
          children: [
            Image.network("${Utils.baseImgUrl}${movie.posterPath}",
                width: 100, height: 50, fit: BoxFit.cover),
            UiUtils.horizontalGap(12),
            Expanded(
              child: Text(
                movie.title ?? "Not Found",
                style: TextStyle(
                  color: appColors.primary(),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(iconData, color: appColors.tertiary())
          ],
        ),
      ),
    );
  }

  Widget SearchBar() {
    return AnimatedContainer(
      margin: EdgeInsets.only(top: 44, left: 16, right: 16,bottom: 8),
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: appColors.tertiary(),
      ),
      duration: Duration(seconds: 1),
      child: Row(
        children: [
          UiUtils.horizontalGap(8),
          InkWell(
            onTap: () {
              isSearchBarTapped = false;
              isTyping = false;
              _searchBarController.clear();
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.focusedChild?.unfocus();
              }
              setState(() {});
            },
            child: Icon(
              isSearchBarTapped? Icons.arrow_back:Icons.search_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
          UiUtils.horizontalGap(8),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 16, color: Colors.white),
              onTap: (){
                isSearchBarTapped = true;
                setState(() {});
              },
              onChanged: (string){
                if(string == ""){
                  isTyping = false;
                } else {
                  isTyping = true;
                }
                setState(() {});
              },
              controller: _searchBarController,
              textAlignVertical: TextAlignVertical.center,
              maxLines: 1,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 14),
                  hintText: ("Movies, shows and more"),
                  hintStyle: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
          Icon(
            isTyping? Icons.cancel:Icons.keyboard_voice_outlined,
            color: Colors.white,
            size: 24,
          ),
          UiUtils.horizontalGap(8),
        ],
      ),
    );
  }

  Widget SearchTopicHeading(
      {required String headingText, required IconData iconData}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 16,
            color: appColors.primary(),
          ),
          UiUtils.horizontalGap(8),
          Text(
            headingText,
            style: TextStyle(
                color: appColors.primary(), fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
