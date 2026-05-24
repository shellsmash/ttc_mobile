import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../../../../models/station_stop.dart';
import 'line.dart';

class Line6 extends TransitLineComponent {
  Line6()
    : super(
        lineColor: const Color(0xFF8A8D8F),
        waypoints: [
          StationStop(
            stopId: "16289",
            name: 'Humber College',
            pos: Vector2(-1650, 350),
          ),
          StationStop(
            stopId: "16291",
            name: 'Westmore',
            pos: Vector2(-1650, 275),
          ),
          StationStop(
            stopId: "16293",
            name: 'Martin Grove',
            pos: Vector2(-1550, 275),
          ),
          StationStop(
            stopId: "16295",
            name: 'Albion',
            pos: Vector2(-1450, 275),
          ),
          StationStop(
            stopId: "16297",
            name: 'Stevenson',
            pos: Vector2(-1375, 275),
          ),
          StationStop(
            stopId: "16299",
            name: 'Mount Olive',
            pos: Vector2(-1300, 275),
          ),
          StationStop(
            stopId: "16301",
            name: 'Rowntree Mills',
            pos: Vector2(-1225, 275),
          ),
          StationStop(
            stopId: "16303",
            name: 'Pearldale',
            pos: Vector2(-1150, 275),
          ),
          StationStop(
            stopId: "16305",
            name: 'Duncanwoods',
            pos: Vector2(-1075, 275),
          ),
          StationStop(
            stopId: "16307",
            name: 'Milvan Rumike',
            pos: Vector2(-1000, 275),
          ),
          StationStop(stopId: "16309", name: 'Emery', pos: Vector2(-925, 275)),
          StationStop(
            stopId: "16311",
            name: 'Signet Arrow',
            pos: Vector2(-850, 275),
          ),
          StationStop(
            stopId: "16313",
            name: 'Norfinch Oakdale',
            pos: Vector2(-775, 275),
          ),
          StationStop(
            stopId: "16315",
            name: 'Jane and Finch',
            pos: Vector2(-700, 275),
          ),
          StationStop(
            stopId: "16250",
            name: 'Driftwood',
            pos: Vector2(-625, 275),
          ),
          StationStop(
            stopId: "16319",
            name: 'Tobermory',
            pos: Vector2(-550, 275),
          ),
          StationStop(
            stopId: "16321",
            name: 'Sentinel',
            pos: Vector2(-475, 275),
          ),
          StationStop(stopId: "9149", name: '', pos: Vector2(-400, 200)),
        ],
      );

  @override
  void addText(Canvas canvas, Offset offset, String text, TextPainter tp) {
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(0.0);
    tp.paint(canvas, Offset(-tp.width / 2, tp.height));
  }
}
