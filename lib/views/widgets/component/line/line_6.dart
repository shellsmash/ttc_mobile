import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'line.dart';

class Line6 extends TransitLineComponent {
  Line6()
    : super(
        lineColor: const Color(0xFF8A8D8F),
        waypoints: [
          Vector2(-900, 400), // Humber College
          Vector2(-900, 350), // Westmore
          Vector2(-250, 350), // Sentinel
          Vector2(-230, 300), // Finch West (Transfer: Line 1)
        ],
      );


}
