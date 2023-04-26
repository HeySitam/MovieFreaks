import 'package:flutter/material.dart';

class SectionDividerWidget extends StatelessWidget {
  const SectionDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        child: Divider(
          color: Theme.of(context).colorScheme.tertiary,
        ));
  }
}
