import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/ui/themes/colors.dart';

class MovieOverviewWidget extends StatefulWidget{
  final movieOverview;
  MovieOverviewWidget({required this.movieOverview});
  @override
  State<MovieOverviewWidget> createState() => _MovieOverviewWidgetState();
}

class _MovieOverviewWidgetState extends State<MovieOverviewWidget> {
  bool _isOverviewExpanded = false;
  late AppColors appColors;

  @override
  void initState() {
    appColors = AppColors(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 32, top: 16),
        child: GestureDetector(
            onTap: () {
              _isOverviewExpanded = !_isOverviewExpanded;
              setState(() {});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  maxLines: _isOverviewExpanded ? null : 2,
                  overflow: TextOverflow.fade,
                  text: TextSpan(
                    text: widget.movieOverview,
                    style: TextStyle(
                        color: appColors.primary(),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '...less',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.pinkAccent)),
                    ],
                  ),
                ),
                Visibility(
                  visible: !_isOverviewExpanded,
                  child: const Text('...more',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.pinkAccent)),
                ),
              ],
            )),
      ),
    );
  }
}