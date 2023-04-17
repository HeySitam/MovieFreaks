import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/utils/utils.dart';

import '../widgets/page_header.dart';

class MovieDetailPage extends StatelessWidget {
  final movieId;
  final backDropPath;
  final heroTag;

  MovieDetailPage({this.movieId, this.backDropPath, this.heroTag});

  @override
  Widget build(BuildContext context) {
    print("received argument is $heroTag");
    var imgUrl = "${Utils.baseImgUrl}$backDropPath";
    return Scaffold(
      body: ColoredBox(
        color: Utils.background_color,
        child: Column(
          children: [
            DetailPageHeader(movieTitle: "Movie Title"),
            Hero(
              tag: heroTag,
              child: Image.network(imgUrl,
                  height: 250,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  loadingBuilder:
                      (context, child,
                          loadingProgress) {
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
            ),
          ],
        ),
      ),
    );
  }
}
