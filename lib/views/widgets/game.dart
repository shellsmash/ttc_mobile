import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:ttc/models/disruption.dart';
import 'package:ttc/models/stations_v2.dart';

import 'component/station.dart';
import 'component/subway_line.dart';

class TTCMapGame extends FlameGame with DragCallbacks, ScaleCallbacks {
  final Function(Station) onStationTap;

  final double canvasWidth = 1600;
  final double canvasHeight = 1300;

  double _startZoom = 1.0;

  List<LineDisruption> disruptions = [];
  List<Station> stations = [];

  TTCMapGame({
    required this.onStationTap,
    this.disruptions = const [],
    required this.stations,
  });

  // List<Station> get _stations {
  //   return [
  //     // --- LINE 6 ---
  //     // Station(name: "Humber College", pos: Vector2(-700, 250), lines: [6]),
  //     // Station(name: "Westmore", pos: Vector2(-650, 250), lines: [6]),
  //     // Station(name: "Martin Grove", pos: Vector2(-600, 250), lines: [6]),
  //     // Station(name: "Albion", pos: Vector2(-550, 250), lines: [6]),
  //     // Station(name: "Stevenson", pos: Vector2(-500, 250), lines: [6]),
  //     // Station(name: "Mount Olive", pos: Vector2(-450, 250), lines: [6]),
  //     // Station(name: "Rowntree Mills", pos: Vector2(-400, 250), lines: [6]),
  //     // Station(name: "Pearldale", pos: Vector2(-350, 250), lines: [6]),
  //     // Station(name: "Duncanwoods", pos: Vector2(-300, 250), lines: [6]),
  //     // Station(name: "Milvan Rumike", pos: Vector2(-250, 250), lines: [6]),
  //     // Station(name: "Emery", pos: Vector2(-200, 250), lines: [6]),
  //     // Station(name: "Signet Arrow", pos: Vector2(-150, 250), lines: [6]),
  //     // Station(name: "Norfinch Oakdale", pos: Vector2(-100, 250), lines: [6]),
  //     // Station(name: "Jane and Finch", pos: Vector2(-50, 250), lines: [6]),
  //     // Station(name: "Driftwood", pos: Vector2(0, 250), lines: [6]),
  //     // Station(name: "Tobermory", pos: Vector2(50, 250), lines: [6]),
  //     // Station(name: "Sentinel", pos: Vector2(100, 250), lines: [6]),
  //
  //     // --- LINE 1 (Down to Finch West) ---
  //     // Station(name: "Vaughan MC", pos: Vector2(150, 50), lines: [1], status: StationStatus.securityIncident),
  //     // Station(name: "Highway 407", pos: Vector2(150, 100), lines: [1]),
  //     // Station(name: "Pioneer Village", pos: Vector2(150, 150), lines: [1]),
  //     // Station(name: "York University", pos: Vector2(150, 200), lines: [1]),
  //     // Station(name: "Finch West", pos: Vector2(150, 250), lines: [1, 6]),
  //
  //     // --- LINE 1 (Finch West to Cedarvale) ---
  //     // Station(name: "Downsview Park", pos: Vector2(150, 300), lines: [1]),
  //     // Station(name: "Sheppard West", pos: Vector2(150, 350), lines: [1]),
  //     // Station(name: "Wilson", pos: Vector2(150, 400), lines: [1]),
  //     // Station(name: "Yorkdale", pos: Vector2(175, 450), lines: [1]),
  //     // Station(name: "Lawrence West", pos: Vector2(200, 500), lines: [1]),
  //     // Station(name: "Glencairn", pos: Vector2(225, 550), lines: [1]),
  //
  //     // --- LINE 5 (West of Cedarvale) ---
  //     // Station(name: "Mount Dennis", pos: Vector2(0, 600), lines: [5]),
  //     // Station(name: "Keelesdale", pos: Vector2(50, 600), lines: [5]),
  //     // Station(name: "Caledonia", pos: Vector2(100, 600), lines: [5]),
  //     // Station(name: "Fairbank", pos: Vector2(150, 600), lines: [5]),
  //     // Station(name: "Oakwood", pos: Vector2(200, 600), lines: [5]),
  //     //
  //     // Station(name: "Cedarvale", pos: Vector2(250, 600), lines: [1, 5]),
  //
  //     // --- LINE 1 (Cedarvale to Spadina) ---
  //     // Station(name: "St Clair West", pos: Vector2(275, 650), lines: [1]),
  //     // Station(name: "Dupont", pos: Vector2(300, 700), lines: [1]),
  //
  //     // --- LINE 2 (West of Spadina) ---
  //     Station(name: "Kipling", pos: Vector2(25, 800), lines: [2]),
  //     Station(name: "Islington", pos: Vector2(75, 800), lines: [2]),
  //     Station(name: "Royal York", pos: Vector2(125, 800), lines: [2]),
  //     Station(name: "Old Mill", pos: Vector2(175, 800), lines: [2]),
  //     Station(name: "Jane", pos: Vector2(225, 800), lines: [2]),
  //     Station(name: "Runnymede", pos: Vector2(275, 800), lines: [2]),
  //     Station(name: "High Park", pos: Vector2(325, 800), lines: [2]),
  //     Station(name: "Keele", pos: Vector2(375, 800), lines: [2]),
  //     Station(name: "Dundas West", pos: Vector2(425, 800), lines: [2]),
  //     Station(name: "Lansdowne", pos: Vector2(475, 800), lines: [2]),
  //     Station(name: "Dufferin", pos: Vector2(525, 800), lines: [2]),
  //     Station(name: "Ossington", pos: Vector2(575, 800), lines: [2]),
  //     Station(name: "Christie", pos: Vector2(625, 800), lines: [2]),
  //     Station(name: "Bathurst", pos: Vector2(675, 800), lines: [2]),
  //
  //     Station(name: "Spadina", pos: Vector2(725, 800), lines: [1, 2]),
  //     Station(name: "St George", pos: Vector2(775, 800), lines: [1, 2]),
  //
  //     // --- LINE 1 (St George to Bloor-Yonge) ---
  //     // Station(name: "Museum", pos: Vector2(400, 850), lines: [1]),
  //     // Station(name: "Queen's Park", pos: Vector2(400, 900), lines: [1]),
  //     // Station(name: "St Patrick", pos: Vector2(400, 950), lines: [1]),
  //     // Station(name: "Osgoode", pos: Vector2(400, 1000), lines: [1]),
  //     // Station(name: "St Andrew", pos: Vector2(400, 1050), lines: [1]),
  //     // Station(name: "Union", pos: Vector2(500, 1100), lines: [1]),
  //     // Station(name: "King", pos: Vector2(600, 1050), lines: [1]),
  //     // Station(name: "Queen", pos: Vector2(600, 1000), lines: [1]),
  //     // Station(name: "Dundas", pos: Vector2(600, 950), lines: [1]),
  //     // Station(name: "College", pos: Vector2(600, 900), lines: [1]),
  //     // Station(name: "Wellesley", pos: Vector2(600, 850), lines: [1]),
  //
  //     // --- LINE 2 (Bay) ---
  //     Station(name: "Bay", pos: Vector2(825, 800), lines: [2]),
  //     Station(
  //       name: "Bloor-Yonge",
  //       pos: Vector2(875, 800),
  //       lines: [1, 2],
  //       status: StationStatus.securityIncident,
  //     ),
  //
  //     // --- LINE 1 (Bloor-Yonge to Eglinton) ---
  //     Station(name: "Rosedale", pos: Vector2(875, 750), lines: [1]),
  //     Station(name: "Summerhill", pos: Vector2(875, 700), lines: [1]),
  //     Station(name: "St Clair", pos: Vector2(875, 650), lines: [1]),
  //     Station(name: "Davisville", pos: Vector2(875, 600), lines: [1]),
  //
  //     // --- LINE 5 (Cedarvale to Eglinton) ---
  //     // Station(name: "Forest Hill", pos: Vector2(337.5, 587.5), lines: [5]),
  //     // Station(name: "Chaplin", pos: Vector2(425, 575), lines: [5]),
  //     // Station(name: "Avenue", pos: Vector2(512.5, 562.5), lines: [5]),
  //     //
  //     // Station(name: "Eglinton", pos: Vector2(600, 550), lines: [1, 5]),
  //     //
  //     // // --- LINE 1 (Eglinton to Sheppard-Yonge) ---
  //     // Station(name: "Lawrence", pos: Vector2(600, 500), lines: [1]),
  //     // Station(name: "York Mills", pos: Vector2(600, 450), lines: [1]),
  //     //
  //     // Station(name: "Sheppard-Yonge", pos: Vector2(600, 400), lines: [1, 4]),
  //     //
  //     // // --- LINE 4 ---
  //     // Station(name: "Bayview", pos: Vector2(650, 400), lines: [4]),
  //     // Station(name: "Bessarion", pos: Vector2(700, 400), lines: [4]),
  //     // Station(name: "Leslie", pos: Vector2(750, 400), lines: [4]),
  //     // Station(name: "Don Mills", pos: Vector2(800, 400), lines: [4]),
  //     //
  //     // // --- LINE 1 (North of Sheppard-Yonge) ---
  //     // Station(name: "North York Centre", pos: Vector2(600, 350), lines: [1]),
  //     // Station(name: "Finch", pos: Vector2(600, 300), lines: [1]),
  //
  //     // --- LINE 2 (East of Bloor-Yonge) ---
  //     Station(name: "Sherbourne", pos: Vector2(925, 800), lines: [2]),
  //     Station(name: "Castle Frank", pos: Vector2(975, 800), lines: [2]),
  //     Station(name: "Broadview", pos: Vector2(1025, 800), lines: [2]),
  //     Station(name: "Chester", pos: Vector2(1075, 800), lines: [2]),
  //     Station(name: "Pape", pos: Vector2(1125, 800), lines: [2]),
  //     Station(name: "Donlands", pos: Vector2(1175, 800), lines: [2]),
  //     Station(name: "Greenwood", pos: Vector2(1225, 800), lines: [2]),
  //     Station(name: "Coxwell", pos: Vector2(1275, 800), lines: [2]),
  //     Station(name: "Woodbine", pos: Vector2(1325, 800), lines: [2]),
  //     Station(name: "Main Street", pos: Vector2(1375, 775), lines: [2]),
  //     Station(name: "Victoria Park", pos: Vector2(1425, 750), lines: [2]),
  //     Station(name: "Warden", pos: Vector2(1475, 725), lines: [2]),
  //
  //     // --- LINE 5 (East of Eglinton) ---
  //     // Station(name: "Mount Pleasant", pos: Vector2(650, 550), lines: [5]),
  //     // Station(name: "Leaside", pos: Vector2(700, 550), lines: [5]),
  //     // Station(name: "Laird", pos: Vector2(750, 550), lines: [5]),
  //     // Station(name: "Sunnybrook Park", pos: Vector2(800, 550), lines: [5]),
  //     // Station(name: "Don Valley", pos: Vector2(850, 550), lines: [5]),
  //     // Station(name: "Aga Khan Park & Museum", pos: Vector2(900, 550), lines: [5]),
  //     // Station(name: "Wynford", pos: Vector2(950, 550), lines: [5]),
  //     // Station(name: "Sloane", pos: Vector2(1000, 550), lines: [5]),
  //     // Station(name: "O'Connor", pos: Vector2(1050, 550), lines: [5]),
  //     // Station(name: "Pharmacy", pos: Vector2(1100, 550), lines: [5]),
  //     // Station(name: "Hakimi Lebovic", pos: Vector2(1150, 550), lines: [5]),
  //     // Station(name: "Golden Mile", pos: Vector2(1200, 550), lines: [5]),
  //     // Station(name: "Birchmount", pos: Vector2(1250, 550), lines: [5]),
  //
  //     // Kennedy is at 1250, 800. Ionview is at 1250, 675. Birchmount at 1250, 550.
  //     // Station(name: "Ionview", pos: Vector2(1250, 675), lines: [5]),
  //     Station(name: "Kennedy", pos: Vector2(1525, 1800), lines: [2, 3, 5]),
  //
  //     // --- LINE 3 ---
  //     // Station(name: "Lawrence East", pos: Vector2(1250, 750), lines: [3]), // Changed y from 750 to 750, x is 1250.
  //     // Wait, if Kennedy is 1250, 800. Line 3 goes up from Kennedy...
  //     // Kennedy 1250, 800.
  //     // Lawrence East 1250, 750
  //     // Ellesmere 1250, 700
  //     // Midland 1250, 650
  //     // Scarborough Centre 1300, 600
  //     // McCowan 1350, 600
  //
  //     // The problem is Line 5 Ionview is at 1250, 675. This overlaps with Line 3 (Midland 1250, 650, Ellesmere 1250, 700).
  //     // Let's adjust Line 3 to branch off slightly to avoid Line 5 which goes straight down to Kennedy.
  //
  //     // Station(name: "Ellesmere", pos: Vector2(1250, 700), lines: [3]),
  //     // Station(name: "Midland", pos: Vector2(1250, 650), lines: [3]),
  //     // Station(name: "Scarborough Centre", pos: Vector2(1300, 600), lines: [3]),
  //     // Station(name: "McCowan", pos: Vector2(1350, 600), lines: [3]),
  //   ];
  // }

  @override
  void onHotReload() {
    // TODO: implement onHotReload
    super.onHotReload();
    updateStations();
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
    updateStations();
    // for (var s in stations) {
    //   world.add(StationComponent(station: s, onSelected: onStationTap));
    // }

    camera.viewfinder.anchor = Anchor.center;
    camera.setBounds(Rectangle.fromLTWH(0, 0, canvasWidth, canvasHeight));
  }

  void updateStations() {
    world.removeAll(world.children.whereType<SubwayLinesComponent>());
    // world.add(SubwayLinesComponent(stations, disruptions: disruptions));
    var oldComponents = world.children.whereType<StationComponent>();
    world.removeAll(oldComponents);

    for (var s in stations) {
      world.add(StationComponent(station: s, onSelected: onStationTap));
    }
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
