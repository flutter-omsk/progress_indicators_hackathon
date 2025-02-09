import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';

class Martynov extends StatefulWidget {
  const Martynov({super.key});

  @override
  State<Martynov> createState() => _MartynovState();
}

class _MartynovState extends State<Martynov> with SingleTickerProviderStateMixin {
  final _controller = AnimatedGlitchController(
    frequency: const Duration(milliseconds: 100),
    level: 1,
    distortionShift: const DistortionShift(count: 3),
  );

  late final AnimationController _animationController;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.blueAccent,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Саша Мартынов'),
      ),
      body: Center(
        child: SizedBox.square(
          dimension: 64,
          child: AnimatedGlitch(
            controller: _controller,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                strokeWidth: 8,
                //color: indicatorColor,
                valueColor: _colorAnimation,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
