import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';

class GlitchProgressIndicator extends StatefulWidget {
  const GlitchProgressIndicator({super.key});

  @override
  State<GlitchProgressIndicator> createState() => _GlitchProgressIndicatorState();
}

class _GlitchProgressIndicatorState extends State<GlitchProgressIndicator>
    with SingleTickerProviderStateMixin {
  final _controller = AnimatedGlitchController(
    frequency: const Duration(milliseconds: 200),
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
        title: Text('Прогресс индикатор с глитчем'),
      ),
      body: Center(
        child: SizedBox.square(
          dimension: 96,
          child: AnimatedGlitch(
            controller: _controller,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                strokeWidth: 16,
                valueColor: _colorAnimation,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
