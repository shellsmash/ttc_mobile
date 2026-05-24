import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'line.dart';

class Line2 extends TransitLineComponent {
  Line2()
    : super(
        lineColor: const Color(0xFF00923F),
        waypoints: [
          Vector2(-600, 850), // Kipling
          Vector2(-350, 850), // Dundas West (Transfer: UP Express)
          Vector2(-150, 850), // Spadina (Transfer: Line 1)
          Vector2(-70, 850), // St. George (Transfer: Line 1)
          Vector2(-70, 850), // Bloor-Yonge (Transfer: Line 1)
          Vector2(800, 850), // Main Street
          Vector2(1000, 600), // Kennedy (Transfer: Line 5)
          // Vector2(550, 650), // Scarborough Centre loop start
          // Vector2(650, 650), // East terminus
        ],
      );
}
