import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/utils/utils.dart';

class VideoListWidget extends StatelessWidget {
  final String? backDropPath;
  VideoListWidget({this.backDropPath});
  @override
  Widget build(BuildContext context) {
    String backDropUrl = "${Utils.baseImgUrl}$backDropPath";
    const placeHolderImgPath = "assets/images/placeholder_poster.jpg";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 8),
          child: Text(
            "Trailers & More",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 160,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
             // itemCount: castList?.length ?? 0,
              itemCount: 20,
              itemBuilder: (context, index) =>
                  Container(
                    margin: const EdgeInsets.only(left: 2, right: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Card(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          child: Stack(
                            children:[
                              if (backDropPath != null) Image.network(
                                backDropUrl,
                              fit: BoxFit.cover,
                              width: 200,
                              height: 120,
                            ) else Image.asset(
                                placeHolderImgPath,
                                fit: BoxFit.cover,
                                width: 200,
                                height: 120,
                              ),
                               Positioned(
                                left: 4,
                                bottom: 4,
                                child: SizedBox(
                                  height: 34,
                                  width: 34,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: RadialGradient(
                                        colors:[
                                          Colors.black87,
                                          Colors.transparent
                                        ]
                                      )
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 8,
                                bottom: 8,
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Dummy Trailer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
                  )),
        )
      ],
    );
  }
}

