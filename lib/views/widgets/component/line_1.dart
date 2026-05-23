import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'line.dart';

class Line1 extends TransitLineComponent {
  Line1()
    : super(
        lineColor: const Color(0xFFFFC20E),
        waypoints: [
          Vector2(-350, 150), // Vaughan Metropolitan Centre
          Vector2(-150, 400), // Sheppard West
          Vector2(-150, 600), // Cedarvale (Transfer: Line 5)
          Vector2(-150, 840), // Spadina (Transfer: Line 2)
          Vector2(-70, 840), // St. George (Transfer: Line 2)
          Vector2(-70, 1000), // Osgoode / St Andrew
          Vector2(0, 1080), // Union (Transfer: UP Express)
          Vector2(70, 1000), // King / Queen
          Vector2(70, 800), // Bloor-Yonge (Transfer: Line 2)
          Vector2(70, 600), // Eglinton (Transfer: Line 5)
          Vector2(70, 350), // Sheppard-Yonge (Transfer: Line 4)
          Vector2(70, 200), // Finch
        ],
      );
}
