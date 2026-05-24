import 'package:flame/components.dart';

enum StationStatus { normal, securityIncident }

class StationStop {
  final String stopId;
  final Vector2 pos;
  String name;

  StationStop({required this.stopId, required this.name, required this.pos}) {
    if (name.split(" ").length > 2) {
      name =
          "${name.split(" ").sublist(0, 2).join(" ")}\n${name.split(" ").sublist(2).join(" ")}";
    }
  }

  Vector2 textPosition() {
    return Vector2(pos.x + 20, pos.y - 10);
  }

  String toJson() {
    return '{"stop_id": "$stopId", "pos": "${pos.x}, ${pos.y}"}';
  }

  Map<String, String> toMap() {
    return <String, String>{'stop_id': stopId, 'pos': '${pos.x}, ${pos.y}'};
  }
}
