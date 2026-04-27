
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:ttc/models/stations_v2.dart';

class SubwayLinesComponent extends Component {
  final List<Station> stations;
  SubwayLinesComponent(this.stations);

  final Map<int, Paint> linePaints = {
    1: Paint()..color = const Color(0xFFFFCB0C)..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round,
    2: Paint()..color = const Color(0xFF009739)..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round,
    3: Paint()..color = const Color(0xFF00AADE)..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round,
    4: Paint()..color = const Color(0xFFB32078)..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round,
  };

  @override
  void render(Canvas canvas) {
    for (int lineId in [1, 2, 3, 4]) {
      final lineStations = stations.where((s) => s.lines.contains(lineId)).toList();
      if (lineStations.length < 2) continue;

      final path = Path();
      path.moveTo(lineStations.first.pos.x, lineStations.first.pos.y);
      for (int i = 1; i < lineStations.length; i++) {
        path.lineTo(lineStations[i].pos.x, lineStations[i].pos.y);
      }
      canvas.drawPath(path, linePaints[lineId]!);
    }
  }
}
