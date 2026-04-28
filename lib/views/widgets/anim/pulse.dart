import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PulseEffect extends CircleComponent {
  PulseEffect({Vector2? position}) : super(
    radius: 0,
    position: position ?? Vector2.zero(),
    anchor: Anchor.center,
    paint: Paint()..color = Colors.red,
  );

  double _timer = 0;

  @override
  void update(double dt) {
    super.update(dt);
    _timer += dt;
    double progress = (_timer % 1.2) / 1.2;
    radius = 5 + (progress * 25);
    paint.color = Colors.red.withValues(alpha: 1.0 - progress);
  }
}
