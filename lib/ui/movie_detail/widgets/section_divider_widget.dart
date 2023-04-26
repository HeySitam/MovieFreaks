import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/main.dart';
import 'package:flutter_ui_practice/ui/themes/colors.dart';

class SectionDividerWidget extends StatelessWidget {
  const SectionDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
   AppColors appColors = AppColors(context: context);
    return  Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        child: Divider(
          color: appColors.tertiary(),
        ));
  }
}
