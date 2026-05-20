import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:ttc/models/disruption.dart';
import 'package:ttc/models/stations_v2.dart';

class SubwayLinesComponent extends Component {
  final List<Station> stations;
  final List<LineDisruption> disruptions;

  SubwayLinesComponent(this.stations, {this.disruptions = const []});

  final Map<int, Paint> linePaints = {
    1: Paint()
      ..color = const Color(0xFFFFCB0C)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round,
    2: Paint()
      ..color = const Color(0xFF009739)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round,
    3: Paint()
      ..color = const Color(0xFF00AADE)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round,
    4: Paint()
      ..color = const Color(0xFFB32078)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round,
    5: Paint()
      ..color = const Color(0xFFFFA500) // Orange
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round,
    6: Paint()
      ..color = const Color(0xFF0000FF) // Blue
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round,
  };

  final Paint disruptedLine = Paint()
    ..color = const Color(0xFF8E0000)
    ..strokeWidth = 8
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  bool _isSegmentDisrupted(String stationA, String stationB) {
    return disruptions.any(
      (d) =>
          ((d.fromStationName.contains(stationA) &&
              d.toStationName.contains(stationB)) ||
          (d.fromStationName.contains(stationB) &&
              d.toStationName.contains(stationA))),
    );
  }

  @override
  void render(Canvas canvas) {
    for (int lineId in [1, 2, 3, 4, 5, 6]) {
      final lineStations = stations
          .where((s) => s.lines.contains(lineId))
          .toList();
      if (lineStations.length < 2) continue;

      // Draw normal segments
      for (int i = 0; i < lineStations.length - 1; i++) {
        final currentStation = lineStations[i];
        final nextStation = lineStations[i + 1];

        final isDisrupted = _isSegmentDisrupted(
          currentStation.name,
          nextStation.name,
        );
        final paint = isDisrupted ? disruptedLine : linePaints[lineId]!;

        // Create a dashed effect for disrupted segments
        if (isDisrupted) {
          _drawDashedLine(
            canvas,
            currentStation.pos,
            nextStation.pos,
            paint,
            dashWidth: 10,
            dashGap: 5,
          );
        } else {
          canvas.drawLine(
            currentStation.pos.toOffset(),
            nextStation.pos.toOffset(),
            paint,
          );
        }
      }
    }
  }

  void _drawDashedLine(
    Canvas canvas,
    Vector2 from,
    Vector2 to,
    Paint paint, {
    double dashWidth = 10,
    double dashGap = 5,
  }) {
    final dx = to.x - from.x;
    final dy = to.y - from.y;
    final distance = math.sqrt((dx * dx + dy * dy).toDouble());
    final steps = (distance / (dashWidth + dashGap)).ceil();

    for (int i = 0; i < steps; i++) {
      final startRatio = (i * (dashWidth + dashGap)) / distance;
      final endRatio = (i * (dashWidth + dashGap) + dashWidth) / distance;

      final startX = from.x + dx * startRatio;
      final startY = from.y + dy * startRatio;
      final endX = from.x + dx * endRatio.clamp(0, 1);
      final endY = from.y + dy * endRatio.clamp(0, 1);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }
}
