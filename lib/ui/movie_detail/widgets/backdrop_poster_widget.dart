import 'package:flutter/material.dart';

class BackDropPosterWidget extends StatelessWidget{
  final String imgUrl;
  final BuildContext context;
  final String heroTag;
  const BackDropPosterWidget({super.key, required this.imgUrl,required this.context,required this.heroTag});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
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
}