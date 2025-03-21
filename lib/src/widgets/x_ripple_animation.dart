import 'dart:math';

import 'package:flutter/material.dart';

class XRippleAnimationPainter extends CustomPainter {
  XRippleAnimationPainter(
    this._animation, {
    required this.color,
  }) : super(repaint: _animation);
  final Color color;
  final AnimationController _animation;

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 0.8);
    final int alpha = (opacity * 255).toInt();
    final Color color = this.color.withAlpha(alpha);
    final double size = rect.width * 0.7;
    final double area = size * size;
    final double radius = sqrt(area * value / 4.0);
    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    if (_animation.isAnimating) {
      for (int wave = 3; wave >= 0; wave--) {
        circle(canvas, rect, wave + _animation.value);
      }
    }
  }

  @override
  bool shouldRepaint(XRippleAnimationPainter oldDelegate) => true;
}
