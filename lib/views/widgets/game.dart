import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:ttc/models/disruption.dart';
import 'package:ttc/models/station_stop.dart';
import 'package:ttc/views/widgets/component/line/line_1.dart';

import 'component/line/line_2.dart';
import 'component/line/line_4.dart';
import 'component/line/line_5.dart';
import 'component/line/line_6.dart';

class TTCMapGame extends FlameGame with DragCallbacks, ScaleCallbacks {
  // final Function(Station) onStationTap;

  final double canvasWidth = 1600;
  final double canvasHeight = 1300;

  double _startZoom = 1.0;

  List<LineDisruption> disruptions = [];
  List<StationStop> stations = [];

  Vector2 cameraPos = Vector2.zero();

  TTCMapGame();

  @override
  void onHotReload() {
    // TODO: implement onHotReload
    super.onHotReload();
    // updateStations();
  }

  @override
  Future<void> onLoad() async {
    // Add the map layout.
    // Background : Black in color
    // TODO : Try to add a background, like discord theme, with a subtle grid or texture to make it more visually appealing.
    // world.add(SubwayLinesComponent(_stations, disruptions: disruptions));

    // TODO: add a new component to highlight disruption between lines.
    // TODO: Like `Pulses` implemented to show disruption at Bloor-Yonge, we can add a `LineDisruptionEffect` that animates along the line segments between affected stations.
    //  This would visually indicate which parts of the line are impacted by an incident, making it easier for users to understand the scope of disruptions at a glance.
    //  Add a thread to allow customers to time-sensitive comment or chat on the incident, and share updates.

    camera.viewfinder.anchor = Anchor.center;
    // camera.setBounds(Rectangle.fromLTWH(0, 0, canvasWidth, canvasHeight));
    camera.viewfinder.zoom = 0.5;
    world.addAll([Line1(), Line2(), Line4(), Line5(), Line6()]);

    // UpExpress()
  }

  // @override
  // void handleHotReload() {
  //   // TODO: implement handleHotReload
  //   super.handleHotReload();
  //   updateStations();
  // }

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
