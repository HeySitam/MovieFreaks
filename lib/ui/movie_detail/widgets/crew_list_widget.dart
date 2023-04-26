import 'package:flutter/material.dart';

import '../../../data/models/movie_related/cast_crew_model.dart';
import '../../../utils/utils.dart';
import '../../themes/colors.dart';

class CrewListWidget extends StatelessWidget{
  final CastCrewWithMovieDetails? detail;
  const CrewListWidget({super.key, required this.detail});
  @override
  Widget build(BuildContext context) {
    final crewList = detail?.credits?.crew;
    AppColors appColors = AppColors(context: context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Text(
            "Crew",
            style: TextStyle(
                fontSize: 18,
                color: appColors.primary(),
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: crewList?.length ?? 0,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                width: 120,
                child: Column(children: [
                  CircleAvatar(
                    radius: 48,
                    foregroundImage:
                    NetworkImage("${Utils.baseImgUrl}${crewList?[index].profilePath ?? "/null"}"),
                    backgroundImage: const AssetImage("assets/images/placeholder_avatar.webp"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${crewList?[index].name}",
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                        fontSize: 14,
                        color: appColors.primary(),
                        fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${crewList?[index].job}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 11,
                        color: appColors.tertiary(),
                        fontWeight: FontWeight.w400),
                  ),
                ]),
              )),
        )
      ],
    );
  }
}