// import 'dart:ui';
//
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flutter/material.dart';
//
// import '../../../models/stations_v2.dart';
// import '../anim/pulse.dart';
//
// class StationComponent extends CircleComponent with TapCallbacks, DragCallbacks {
//   final Station station;
//   final Function(Station) onSelected;
//
//   StationComponent({required this.station, required this.onSelected})
//       : super(
//     position: station.pos,
//     radius: station.lines.length > 1 ? 8 : 5,
//     anchor: Anchor.center,
//     paint: Paint()..color = Colors.white,
//   );
//
//   @override
//   Future<void> onLoad() async {
//
//     add(CircleComponent(
//       radius: radius,
//       paint: Paint()
//         ..color = Colors.black
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 2,
//     ));
//
//     add(TextComponent(
//       text: station.name,
//       position: Vector2(12, 0),
//       anchor: Anchor.centerLeft,
//       angle: -0.785398,
//       textRenderer: TextPaint(
//         style: TextStyle(
//           fontSize: station.lines.length > 1 ? 13 : 11,
//           color: Colors.white,
//           shadows: const [Shadow(blurRadius: 4, color: Colors.black)],
//         ),
//       ),
//     ));
//
//   }
//
//   @override
//   void onTapDown(TapDownEvent event) {
//     onSelected(station);
//   }
//
//   @override
//   void onMount() {
//     super.onMount();
//     if (station.status == StationStatus.securityIncident) {
//       parent?.add(PulseEffect(position: station.pos));
//     }
//   }
// }
