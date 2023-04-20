import 'package:flutter/material.dart';

class SectionDividerWidget extends StatelessWidget {
  const SectionDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        child: Divider(
          color: Colors.white30,
        ));
  }
}
