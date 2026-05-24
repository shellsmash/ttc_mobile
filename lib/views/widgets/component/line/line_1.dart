import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:ttc/models/station_stop.dart';

import 'line.dart';

class Line1 extends TransitLineComponent {
  Line1()
    : super(
        lineColor: const Color(0xFFFFC20E),
        waypoints: [
          StationStop(stopId: "3212", name: 'Finch', pos: Vector2(100, 200)),
          StationStop(
            stopId: "8984",
            name: 'North York Centre',
            pos: Vector2(100, 300),
          ),
          StationStop(
            stopId: "13859",
            name: 'Sheppard-Yonge',
            pos: Vector2(100, 400),
          ),
          StationStop(
            stopId: "9065",
            name: 'York Mills',
            pos: Vector2(100, 450),
          ),
          StationStop(stopId: "1234", name: 'Lawrence', pos: Vector2(100, 500)),
          // Eglinton
          StationStop(stopId: "8977", name: '', pos: Vector2(100, 550)),
          StationStop(
            stopId: "13797",
            name: 'Davisville',
            pos: Vector2(100, 600),
          ),
          StationStop(stopId: "9053", name: 'St Clair', pos: Vector2(100, 650)),
          StationStop(
            stopId: "8953",
            name: 'Summerhill',
            pos: Vector2(100, 700),
          ),
          StationStop(stopId: "3219", name: 'Rosedale', pos: Vector2(100, 750)),
          // bloor-yonge station
          StationStop(stopId: "3213", name: '', pos: Vector2(100, 800)),
          StationStop(
            stopId: "3245",
            name: 'Wellesley',
            pos: Vector2(100, 850),
          ),
          StationStop(stopId: "760", name: 'College', pos: Vector2(100, 900)),
          StationStop(stopId: "2136", name: 'TMU', pos: Vector2(100, 950)),
          StationStop(stopId: "3238", name: 'Queen', pos: Vector2(100, 1000)),
          StationStop(stopId: "3234", name: 'King', pos: Vector2(75, 1100)),
          StationStop(stopId: "246", name: 'Union', pos: Vector2(0, 1200)),
          StationStop(
            stopId: "13817",
            name: 'St Andrew',
            pos: Vector2(-75, 1100),
          ),
          StationStop(
            stopId: "6858",
            name: 'Osgoode',
            pos: Vector2(-100, 1000),
          ),
          StationStop(
            stopId: "2193",
            name: 'St Patrick',
            pos: Vector2(-100, 950),
          ),
          StationStop(
            stopId: "841",
            name: 'Queen\'s Park',
            pos: Vector2(-100, 900),
          ),
          StationStop(stopId: "1456", name: 'Museum', pos: Vector2(-100, 860)),
          // St. George
          StationStop(stopId: "13855", name: '', pos: Vector2(-100, 780)),
          StationStop(
            stopId: "13851",
            name: 'Spadina',
            pos: Vector2(-200, 750),
          ),
          StationStop(stopId: "1027", name: 'Dupont', pos: Vector2(-200, 700)),
          StationStop(
            stopId: "13829",
            name: 'St Clair West',
            pos: Vector2(-200, 625),
          ),
          StationStop(
            stopId: "9895",
            name: 'Cedarvale',
            pos: Vector2(-200, 550),
            // pos: Vector2(-200, 600),
          ),
          StationStop(
            stopId: "3665",
            name: 'Glencairn',
            pos: Vector2(-200, 500),
          ),
          StationStop(
            stopId: "12202",
            name: 'Lawrence West',
            pos: Vector2(-200, 450),
          ),
          StationStop(
            stopId: "1677",
            name: 'Yorkdale',
            pos: Vector2(-200, 400),
          ),
          StationStop(stopId: "13839", name: 'Wilson', pos: Vector2(-200, 350)),
          StationStop(
            stopId: "7275",
            name: 'Sheppard West',
            pos: Vector2(-200, 300),
          ),
          StationStop(
            stopId: "3106",
            name: 'Downsview Park',
            pos: Vector2(-300, 250),
          ),
          StationStop(
            stopId: "9149",
            name: 'Finch West',
            pos: Vector2(-400, 200),
          ),
          StationStop(
            stopId: "1594",
            name: 'York University',
            pos: Vector2(-500, 150),
          ),
          StationStop(
            stopId: "15571",
            name: 'Pioneer Village',
            pos: Vector2(-600, 100),
          ),
          StationStop(
            stopId: "15660",
            name: 'Highway 407',
            pos: Vector2(-700, 50),
          ),
          StationStop(
            stopId: "15662",
            name: 'Vaughan Metropolitan Centre',
            pos: Vector2(-800, 0),
          ),
        ],
      );

  @override
  void addText(Canvas canvas, Offset offset, String text, TextPainter tp) {
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(0.0);
    tp.paint(canvas, Offset(-tp.width - 20, -tp.height / 2));
  }
}
