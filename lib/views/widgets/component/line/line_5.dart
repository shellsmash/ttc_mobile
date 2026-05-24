import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'line.dart';

class Line5 extends TransitLineComponent {
  Line5()
    : super(
        lineColor: const Color(0xFFF37021),
        waypoints: [
          Vector2(-400, 600), // Mount Dennis (Transfer: UP Express)
          Vector2(-150, 600), // Cedarvale (Transfer: Line 1)
          Vector2(70, 600), // Eglinton (Transfer: Line 1)
          Vector2(1000, 600), // Kennedy (Transfer: Line 2)
        ],
      );
}
