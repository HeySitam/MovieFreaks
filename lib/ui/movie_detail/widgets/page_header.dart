import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class DetailPageHeader extends StatelessWidget{
  final movieTitle;
  DetailPageHeader({required this.movieTitle});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: ColoredBox(
        color: Utils.background_color,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("$movieTitle",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel,
                  color: Colors.white,),
              ),
            ),
            _Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _Spacer(){
    return SizedBox(width: 12);
  }

}