import 'package:flutter/material.dart';

@immutable
class ProgressIndicatorInfo {
  final String title;
  final String author;
  final String route;

  const ProgressIndicatorInfo({
    required this.title,
    required this.author,
    required this.route,
  });

  @override
  bool operator ==(covariant ProgressIndicatorInfo other) {
    if (identical(this, other)) return true;
    return other.title == title && other.author == author && other.route == route;
  }

  @override
  int get hashCode => title.hashCode ^ author.hashCode ^ route.hashCode;
}
