import 'package:flutter/material.dart';

import '../../../data/models/movie_related/cast_crew_model.dart';
import '../../../utils/utils.dart';

class CastListWidget extends StatelessWidget{
  final CastCrewWithMovieDetails? detail;
  const CastListWidget({super.key, required this.detail});
  @override
  Widget build(BuildContext context) {
    final castList = detail?.credits?.cast;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 8),
          child: Text(
            "Cast",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: castList?.length ?? 0,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                width: 120,
                child: Column(children: [
                  CircleAvatar(
                    radius: 48,
                    foregroundImage:
                    NetworkImage("${Utils.baseImgUrl}${castList?[index].profilePath ?? "/null"}"),
                    backgroundImage: AssetImage("assets/images/placeholder_avatar.webp"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${castList?[index].name}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "as ${castList?[index].character}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
}