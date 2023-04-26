import 'package:flutter/material.dart';

import '../../../data/models/movie_related/cast_crew_model.dart';
import '../../themes/colors.dart';

class MovieBasicInfoWidget extends StatefulWidget{
  final CastCrewWithMovieDetails? detail;
  MovieBasicInfoWidget({super.key, required this.detail});

  @override
  State<MovieBasicInfoWidget> createState() => _MovieBasicInfoWidgetState();
}

class _MovieBasicInfoWidgetState extends State<MovieBasicInfoWidget> {
  late AppColors appColors;

  @override
  void initState() {
    appColors = AppColors(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,top: 16),
      child: Text(
        _makeInfoText(widget.detail),
        style:  TextStyle(
            color: appColors.primary(), fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  String _makeInfoText(CastCrewWithMovieDetails? detail){
    int runTimeInMins = detail?.runtime ?? 0;
    print("runtime is $runTimeInMins");
    String runTime = "${(runTimeInMins/60).floor()}h ${runTimeInMins%60}m";

    final genreList = detail?.genres ?? [];
    String genres = genreList.isEmpty ? "" : genreList[0].name ?? "";

    for (var idx = 1; idx < genreList.length ; idx++) {
      genres += ", ${genreList[idx].name}";
    }

    String? releaseDate = detail?.releaseDate;

    if(releaseDate != null){
      releaseDate = _formatReleaseDate(releaseDate);
    }

    return "$runTime • $genres • $releaseDate";
  }

  String _formatReleaseDate(String date){
    final dateTime = DateTime.parse(date);
    String dateString = "${dateTime.day}";
    switch(dateTime.month){
      case 1 : {
        dateString += " Jan, ";
      }
      break;
      case 2 : {
        dateString += " Feb, ";
      }
      break;
      case 3 : {
        dateString += " Mar, ";
      }
      break;
      case 4 : {
        dateString += " Apr, ";
      }
      break;
      case 5 : {
        dateString += " May, ";
      }
      break;
      case 6 : {
        dateString += " Jun, ";
      }
      break;
      case 7 : {
        dateString += " Jul, ";
      }
      break;
      case 8 : {
        dateString += " Aug, ";
      }
      break;
      case 9 : {
        dateString += " Sep, ";
      }
      break;
      case 10 : {
        dateString += " Oct, ";
      }
      break;
      case 11 : {
        dateString += " Nov, ";
      }
      break;
      case 12 : {
        dateString += " Dec, ";
      }
      break;
    }

    dateString += "${dateTime.year}";
    return dateString;
  }
}
