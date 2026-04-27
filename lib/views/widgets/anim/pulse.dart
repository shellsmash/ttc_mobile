import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PulseEffect extends CircleComponent {
  PulseEffect() : super(radius: 0, anchor: Anchor.center);

  double _timer = 0;

  @override
  void update(double dt) {
    super.update(dt);
    _timer += dt;
    double progress = (_timer % 1.2) / 1.2;
    radius = 5 + (progress * 25);
    paint.color = Colors.red.withOpacity(1.0 - progress);
  }
}
