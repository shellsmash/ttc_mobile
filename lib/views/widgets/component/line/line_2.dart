import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:ttc/models/station_stop.dart';

import 'line.dart';

class Line2 extends TransitLineComponent {
  Line2()
    : super(
        lineColor: const Color(0xFF00923F),
        waypoints: [
          StationStop(
            stopId: "13785",
            name: 'Kipling',
            pos: Vector2(-1600, 800),
          ),
          StationStop(
            stopId: "13783",
            name: 'Islington',
            pos: Vector2(-1500, 800),
          ),
          StationStop(
            stopId: "13781",
            name: 'Royal York',
            pos: Vector2(-1400, 800),
          ),
          StationStop(
            stopId: "13779",
            name: 'Old Mill',
            pos: Vector2(-1300, 800),
          ),
          StationStop(stopId: "13777", name: 'Jane', pos: Vector2(-1200, 800)),
          StationStop(
            stopId: "13775",
            name: 'Runnymede',
            pos: Vector2(-1100, 800),
          ),
          /////////////////////////////////////
          StationStop(
            stopId: "13773",
            name: 'High Park',
            pos: Vector2(-1000, 800),
          ),
          StationStop(stopId: "11780", name: 'Keele', pos: Vector2(-900, 800)),
          StationStop(
            stopId: "13769",
            name: 'Dundas West',
            pos: Vector2(-800, 800),
          ),
          StationStop(
            stopId: "4408",
            name: 'Lansdowne',
            pos: Vector2(-700, 800),
          ),
          StationStop(
            stopId: "2013",
            name: 'Dufferin',
            pos: Vector2(-600, 800),
          ),
          StationStop(
            stopId: "13763",
            name: 'Ossington',
            pos: Vector2(-500, 800),
          ),
          StationStop(stopId: "776", name: 'Christie', pos: Vector2(-400, 800)),
          StationStop(
            stopId: "13759",
            name: 'Bathurst',
            pos: Vector2(-300, 800),
          ),
          StationStop(
            stopId: "13851",
            name: 'Spadina',
            pos: Vector2(-200, 800),
          ),
          // Transfer: Line 1
          StationStop(
            stopId: "13855",
            name: 'St George',
            pos: Vector2(-100, 800),
          ),
          // Transfer: Line 1
          StationStop(stopId: "235", name: 'Bay', pos: Vector2(0, 800)),
          StationStop(stopId: "13755", name: 'Yonge', pos: Vector2(100, 800)),
          // Transfer: Line 1
          StationStop(
            stopId: "7308",
            name: 'Sherbourne',
            pos: Vector2(200, 800),
          ),
          StationStop(
            stopId: "13751",
            name: 'Castle Frank',
            pos: Vector2(300, 800),
          ),
          StationStop(
            stopId: "13749",
            name: 'Broadview',
            pos: Vector2(400, 800),
          ),
          StationStop(stopId: "13747", name: 'Chester', pos: Vector2(500, 800)),
          StationStop(stopId: "13745", name: 'Pape', pos: Vector2(600, 800)),
          StationStop(
            stopId: "13743",
            name: 'Donlands',
            pos: Vector2(700, 800),
          ),
          StationStop(
            stopId: "13741",
            name: 'Greenwood',
            pos: Vector2(800, 800),
          ),
          StationStop(stopId: "13739", name: 'Coxwell', pos: Vector2(900, 800)),
          StationStop(
            stopId: "13737",
            name: 'Woodbine',
            pos: Vector2(1000, 800),
          ),
          StationStop(
            stopId: "13735",
            name: 'Main Street',
            pos: Vector2(1100, 800),
          ),
          StationStop(
            stopId: "11376",
            name: 'Victoria Park',
            pos: Vector2(1200, 760),
          ),
          StationStop(stopId: "13731", name: 'Warden', pos: Vector2(1300, 720)),
          StationStop(stopId: "3539", name: 'Kennedy', pos: Vector2(1400, 680)),
          // Transfer: Line 5
        ],
      );

  @override
  void addText(Canvas canvas, Offset offset, String text, TextPainter tp) {
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(0.0);
    tp.paint(canvas, Offset(-tp.width / 2, tp.height));
  }
}
