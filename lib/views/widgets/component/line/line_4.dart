import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'line.dart';

class Line4 extends TransitLineComponent {
  Line4()
    : super(
        lineColor: const Color(0xFFB10D69),
        waypoints: [
          Vector2(70, 350), // Sheppard-Yonge (Transfer: Line 1)
          Vector2(350, 350), // Don Mills
        ],
      );
}
