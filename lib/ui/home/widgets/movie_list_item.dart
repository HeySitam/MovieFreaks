import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final imgUrl;
  final rating;
  final votes;
  final _itemH = 167.0;
  final _itemW = 120.0;

  MovieListItem({required this.imgUrl,required this.rating,required this.votes});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
              child: Image.network(
                imgUrl,
                width: _itemW,
                fit: BoxFit.cover,
              ),
          ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, bottom: 2),
              child: Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    size: 16,
                    color: Colors.red,
                  ),
                  SizedBox(width: 4,),
                  Text("$rating/10",
                  style: TextStyle(
                    fontSize: 10
                  ),),
                  SizedBox(width: 4,),
                  Text("$votes votes",
                    style: TextStyle(
                        fontSize: 10
                    ),),
                ],
              ),
            )
          ],
        ),
      );
  }
}
