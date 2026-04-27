

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:ttc/models/stations_v2.dart';
import 'package:ttc/views/widgets/component/station.dart';
import 'package:ttc/views/widgets/component/subway_line.dart';

class TTCMapGame extends FlameGame with DragCallbacks, ScaleCallbacks {
  final List<Station> stations;
  final Function(Station) onStationTap;


  final double canvasWidth = 1600;
  final double canvasHeight = 1300;

  double _startZoom = 1.0;

  TTCMapGame({required this.stations, required this.onStationTap});

  @override
  Future<void> onLoad() async {
    // Add the map layout.
    // Background : Black in color
    // TODO : Try to add a background, like discord theme, with a subtle grid or texture to make it more visually appealing.
    world.add(SubwayLinesComponent(stations));

    // TODO: add a new component to highlight disruption between lines.
    // TODO: Like `Pulses` implemented to show disruption at Bloor-Yonge, we can add a `LineDisruptionEffect` that animates along the line segments between affected stations.
    //  This would visually indicate which parts of the line are impacted by an incident, making it easier for users to understand the scope of disruptions at a glance.
    //  Add a thread to allow customers to time-sensitive comment or chat on the incident, and share updates.
    for (var s in stations) {
      world.add(StationComponent(station: s, onSelected: onStationTap));
    }

    camera.viewfinder.anchor = Anchor.center;
    camera.setBounds(Rectangle.fromLTWH(0, 0, canvasWidth, canvasHeight));
  }


  @override
  void onDragUpdate(DragUpdateEvent event) {
    camera.viewfinder.position -= event.localDelta / camera.viewfinder.zoom;
  }

  @override
  void onScaleStart(ScaleStartEvent event) {
    _startZoom = camera.viewfinder.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateEvent event) {
    final double scaleFactor = event.scale is Vector2
        ? (event.scale as Vector2).x
        : event.scale;

    camera.viewfinder.zoom = (_startZoom * scaleFactor).clamp(0.2, 4.0);
  }
}


