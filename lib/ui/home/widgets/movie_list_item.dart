import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final imgUrl;
  final _itemH = 167.0;
  final _itemW = 116.0;

  MovieListItem({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imgUrl,
          width: _itemW,
          height: _itemH,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
