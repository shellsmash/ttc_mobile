import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../../../../models/station_stop.dart';
import 'line.dart';

class Line4 extends TransitLineComponent {
  Line4()
    : super(
        lineColor: const Color(0xFFB10D69),
        waypoints: [
          StationStop(
            stopId: '13859',
            name: '',
            pos: Vector2(100, 400),
          ),
          // Trattc nsfer: Line 1
          StationStop(
            stopId: '317',
            name: 'Bayview',
            pos: Vector2(200, 400),
          ),
          StationStop(
            stopId: '13677',
            name: 'Bessarion',
            pos: Vector2(300, 400),
          ),
          StationStop(
            stopId: '7204',
            name: 'Leslie',
            pos: Vector2(400, 400),
          ),
          StationStop(
            stopId: '14109',
            name: 'Don Mills',
            pos: Vector2(500, 400),
          ),
          // Transfer: Line 1, Line 2
        ],
      );
  @override
  void addText(Canvas canvas, Offset offset, String text, TextPainter tp) {
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(0.0);
    tp.paint(canvas, Offset(-tp.width / 2, tp.height));
  }
}
