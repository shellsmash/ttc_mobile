import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'line.dart';

class UpExpress extends TransitLineComponent {
  UpExpress()
    : super(
        lineColor: const Color(0xFF0066FF), // Bronze/Brown for UP
        waypoints: [
          Vector2(100, 500), // Pearson Airport
          Vector2(400, 600), // Weston / Mount Dennis area (Transfer: Line 5)
          Vector2(400, 800), // Bloor (Transfer: Line 2 - Dundas West)
          Vector2(600, 1000), // Pathing down rail corridor
          Vector2(750, 1080), // Union (Transfer: Line 1)
        ],
      );
}
