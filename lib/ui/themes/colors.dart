import 'package:flutter/material.dart';

class AppColors {
  BuildContext context;
  AppColors({required this.context});

  Color primary() => Theme.of(context).colorScheme.primary;
  Color secondary() => Theme.of(context).colorScheme.secondary;
  Color tertiary() => Theme.of(context).colorScheme.tertiary;
  Color surface() => Theme.of(context).colorScheme.surface;
  Color background() => Theme.of(context).colorScheme.background;
}