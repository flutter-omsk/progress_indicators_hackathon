import 'dart:math';

import 'package:flutter/material.dart';

class CamomileProgressIndicator extends StatefulWidget {
  const CamomileProgressIndicator({super.key});

  @override
  State<CamomileProgressIndicator> createState() =>
      _CamomileProgressIndicatorState();
}

class _CamomileProgressIndicatorState extends State<CamomileProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final circleAnimation = Tween<double>(begin: 0, end: 15).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0,
        0.2,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    ),
  );
  late final petalAnimation = Tween<double>(begin: 0, end: 7).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.15,
        0.45,
        curve: Curves.linear,
      ),
    ),
  );
  late final rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.5,
        0.65,
        curve: Curves.decelerate,
      ),
    ),
  );
  late final pentalHeightAfterRotation = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 1, end: 1.4), weight: 60),
    TweenSequenceItem(tween: Tween(begin: 1.4, end: 0), weight: 40)
  ]).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.75,
        0.9,
        curve: Curves.ease,
      ),
    ),
  );
  late final pentalCountAfterRotation = Tween<double>(begin: 1, end: 0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.85, 0.85),
    ),
  );
  late final radiusAfterRotation = Tween<double>(begin: 1, end: 0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.8,
        0.95,
        curve: Curves.bounceOut,
      ),
    ),
  );

  late final _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 5),
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ромашка'),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: RepaintBoundary(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: rotationAnimation.value * 2 * pi,
                child: CustomPaint(
                  painter: _CamomilePainter(
                    radius: circleAnimation.value * radiusAfterRotation.value,
                    count:
                        petalAnimation.value * pentalCountAfterRotation.value,
                    height: pentalHeightAfterRotation.value,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CamomilePainter extends CustomPainter {
  final double radius;
  final double count;
  final double height;

  const _CamomilePainter({
    required this.radius,
    required this.count,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    canvas.save();
    for (var i = 0; i < count; i++) {
      final path = Path()
        ..moveTo(size.width / 2 + (radius * cos(-pi / 2 - pi / 10)),
            size.height / 2 + (radius * sin(-pi / 2 - pi / 10)))
        ..quadraticBezierTo(
          size.width / 2 - radius * 1.4 * height * _heightProgress(count, i),
          size.height / 2 - radius * 2.5 * height * _heightProgress(count, i),
          size.width / 2,
          size.height / 2 - radius * 4 * height * _heightProgress(count, i),
        )
        ..quadraticBezierTo(
          size.width / 2 + radius * 1.4 * height * _heightProgress(count, i),
          size.height / 2 - radius * 2.5 * height * _heightProgress(count, i),
          size.width / 2 + (radius * cos(-pi / 2 + pi / 10)),
          size.height / 2 + (radius * sin(-pi / 2 + pi / 10)),
        )
        ..close();

      canvas.drawPath(path, paint..color = Colors.white);
      canvas.drawShadow(path, Colors.blueGrey.withAlpha(40), 2, false);
      canvas.rotate((2 * pi) / 7);
    }
    canvas.restore();
    canvas.drawShadow(
      Path()
        ..addOval(
          Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: radius,
          ),
        ),
      Colors.orangeAccent.withAlpha(40),
      2,
      false,
    );
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius,
        paint..color = Colors.amber);
  }

  double _heightProgress(double num, int i) {
    if (num > i + 1) return 1;
    return num - i;
  }

  @override
  bool shouldRepaint(covariant _CamomilePainter oldDelegate) =>
      radius != oldDelegate.radius ||
      count != oldDelegate.count ||
      height != oldDelegate.height;
}
