import 'package:flutter/material.dart';
import 'package:progress_indicators_hackathon/core/utils/extensions/theme_x.dart';

class Martynov extends StatelessWidget {
  const Martynov({super.key});

  @override
  Widget build(BuildContext context) {
    final indicatorColor = context.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text('Саша Мартынов'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: CircularProgressIndicator(color: indicatorColor)),
      ),
    );
  }
}
