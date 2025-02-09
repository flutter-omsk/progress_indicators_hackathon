import 'package:flutter/material.dart';

extension ThemeX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
