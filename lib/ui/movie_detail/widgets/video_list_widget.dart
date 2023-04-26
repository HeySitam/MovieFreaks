import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/utils/utils.dart';
import 'package:flutter_ui_practice/viewmodels/movie_detail_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../utils/routes.dart';

class VideoListWidget extends StatelessWidget {
  final String? backDropPath;

  VideoListWidget({required this.backDropPath});

  @override
  Widget build(BuildContext context) {
    String backDropUrl = "${Utils.baseImgUrl}$backDropPath";
    const placeHolderImgPath = "assets/images/placeholder_poster.jpg";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Text(
            "Trailers & More",
            style: TextStyle(
                fontSize: 18, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 160,
          child: Consumer<MovieDetailViewModel>(
            builder: (context, vm, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.getVideoInfos.length,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(left: 2, right: 2),
                      width: 200,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                // Navigator.push(context,
                                //   MaterialPageRoute(builder: (context) => PlayVideoPage(
                                //       videoId: vm.getVideoInfos[index].key.toString()
                                //   ))
                                // );

                                Navigator.pushNamed(context, Routes.playVideoPageRoute,arguments: {"videoId": vm.getVideoInfos[index].key.toString()});
                              },
                              child: Card(
                                child: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(4)),
                                  child: Stack(
                                    children: [
                                      if (backDropPath != null)
                                        Image.network(
                                          backDropUrl,
                                          fit: BoxFit.cover,
                                          width: 200,
                                          height: 120,
                                        )
                                      else
                                        Image.asset(
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
                                                gradient: RadialGradient(colors: [
                                              Colors.black87,
                                              Colors.transparent
                                            ])),
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
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                vm.getVideoInfos[index].name.toString(),
                                textAlign: TextAlign.center,
                                style:  TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w400),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ]),
                    )),
          ),
        )
      ],
    );
  }
}
