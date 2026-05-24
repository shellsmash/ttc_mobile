import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../../../../models/station_stop.dart';
import 'line.dart';

class Line5 extends TransitLineComponent {
  Line5()
    : super(
        lineColor: const Color(0xFFF37021),
        waypoints: [
          StationStop(
            stopId: "16067",
            name: 'Mount Dennis',
            pos: Vector2(-575, 600),
          ),
          StationStop(
            stopId: "16202",
            name: 'Keelesdale',
            pos: Vector2(-500, 550),
          ),
          StationStop(
            stopId: "16083",
            name: 'Caledonia',
            pos: Vector2(-425, 550),
          ),
          StationStop(
            stopId: "16204",
            name: 'Fairbank',
            pos: Vector2(-350, 550),
          ),
          StationStop(
            stopId: "16206",
            name: 'Oakwood',
            pos: Vector2(-275, 550),
          ),
          // interchange
          StationStop(
            stopId: "9895",
            name: 'Cedarvale',
            pos: Vector2(-200, 550),
          ),
          // Transfer: Line 1
          StationStop(
            stopId: "16208",
            name: 'Forest Hill',
            pos: Vector2(-125, 550),
          ),
          StationStop(
            stopId: "16210",
            name: 'Chaplin',
            pos: Vector2(-50, 550),
          ),
          StationStop(
            stopId: "16071",
            name: 'Avenue',
            pos: Vector2(15, 550),
          ),
          // Interchange
          StationStop(
            stopId: "8977",
            name: 'Eglinton',
            pos: Vector2(100, 550),
          ),
          // Transfer: Line 1
          StationStop(
            stopId: "16212",
            name: 'Mount Pleasant',
            pos: Vector2(250, 550),
          ),
          StationStop(
            stopId: "16214",
            name: 'Leaside',
            pos: Vector2(325, 550),
          ),
          StationStop(
            stopId: "16075",
            name: 'Laird',
            pos: Vector2(400, 550),
          ),
          StationStop(
            stopId: "16216",
            name: 'Sunnybrook Park',
            pos: Vector2(475, 550),
          ),
          StationStop(
            stopId: "9126",
            name: 'Don Valley',
            pos: Vector2(550, 550),
          ),
          StationStop(
            stopId: "16218",
            name: 'Aga Khan Park\n & Museum',
            pos: Vector2(625, 550),
          ),
          StationStop(
            stopId: "16220",
            name: 'Wynford',
            pos: Vector2(700, 550),
          ),
          StationStop(
            stopId: "16079",
            name: 'Sloane',
            pos: Vector2(775, 550),
          ),
          StationStop(
            stopId: "16222",
            name: 'O\'Connor',
            pos: Vector2(850, 550),
          ),
          StationStop(
            stopId: "16224",
            name: 'Pharmacy',
            pos: Vector2(925, 550),
          ),
          StationStop(
            stopId: "16226",
            name: 'Hakimi Lebovic',
            pos: Vector2(1000, 550),
          ),
          StationStop(
            stopId: "16085",
            name: 'Golden Mile',
            pos: Vector2(1175, 550),
          ),
          StationStop(
            stopId: "16228",
            name: 'Birchmount',
            pos: Vector2(1250, 600),
          ),
          StationStop(
            stopId: "16230",
            name: 'Ionview',
            pos: Vector2(1325, 640),
          ),
          StationStop(
            stopId: "3539",
            name: '',
            pos: Vector2(1400, 680),
          ),
          // Transfer: Line 2
        ],
      );
  @override
  void addText(Canvas canvas, Offset offset, String text, TextPainter tp) {
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(0.0);
    tp.paint(canvas, Offset(-tp.width/2, tp.height));
  }
}
