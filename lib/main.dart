// lib/main.dart
//
// import 'package:flame/events.dart';
// import 'package:flame/game.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flame/components.dart';
// import 'package:flame/input.dart';
// import 'package:flame_tiled/flame_tiled.dart';

//
// void main() {
//   runApp(
//     GameWidget(
//       game: TTCGame(),
//     ),
//   );
// }
//
// // lib/ttc_game.dart
//
//
// class TTCGame extends FlameGame with DragCallbacks, ScrollDetector {
//   late final CameraComponent cameraComponent;
//   late final World world;
//
//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();
//
//     world = World();
//     add(world);
//
//     cameraComponent = CameraComponent(world: world);
//     cameraComponent.viewfinder.zoom = 1.0;
//
//     add(cameraComponent);
//
//     final map = await TiledComponent.load(
//       'ttc_map.tmx',
//       Vector2.all(32),
//     );
//
//     world.add(map);
//   }
//
//   @override
//   void onDragUpdate(DragUpdateEvent event) {
//     cameraComponent.viewfinder.position -= event.localDelta;
//   }
//
//   @override
//   void onScroll(PointerScrollInfo info) {
//     final delta = info.scrollDelta.global.y;
//
//     if (delta > 0) {
//       cameraComponent.viewfinder.zoom -= 0.1;
//     } else {
//       cameraComponent.viewfinder.zoom += 0.1;
//     }
//
//     cameraComponent.viewfinder.zoom = cameraComponent.viewfinder.zoom.clamp(
//       0.5,
//       4.0,
//     );
//   }
// }

// }

import 'dart:convert';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:ttc/models/disruption.dart';
import 'package:ttc/models/station_stop.dart';
import 'package:ttc/views/widgets/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TTCMapApp());
}

class TTCMapApp extends StatelessWidget {
  const TTCMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const SubwayMapScreen(),
    );
  }
}

class SubwayMapScreen extends StatefulWidget {
  const SubwayMapScreen({super.key});

  @override
  State<SubwayMapScreen> createState() => _SubwayMapScreenState();
}

class _SubwayMapScreenState extends State<SubwayMapScreen> {
  List<StationStop> stations = [];

  List<LineDisruption> disruptions = [];

  @override
  void initState() {
    super.initState();
    // Example disruptions: Line 2 between Islington and Jane
    disruptions = [
      LineDisruption(
        lineId: 1,
        fromStationName: 'Highway 407',
        toStationName: 'Pioneer Village',
      ),
    ];
  }

  @override
  void didUpdateWidget(covariant SubwayMapScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  Future<bool> initMap() async {
    final res = jsonDecode(
      await DefaultAssetBundle.of(context).loadString("assets/map/map.json"),
    );

    List<int> translateLineNumber(String dat) {
      if (dat.split(",").length > 1) {
        return dat.split(",").map((x) => int.parse(x)).toList();
      }
      return [int.parse(dat)];
    }

    // stations = (res['data'] as List).map((item) =>
    //     Station(
    //       name: item['name'],
    //       pos: Vector2(item['translated_lat'].toDouble(),
    //         item['translated_lon'].toDouble(),),
    //       lines: translateLineNumber(item['line_number']),
    //       stop_id: item['id'],
    //       parent_id: item['parent_station_id'],),).toList();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) => GameWidget(game: TTCMapGame()));
  }

  // void _showDetails(BuildContext context, Station station) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: const Color(0xFF1E1E1E),
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (context) => Padding(
  //       padding: const EdgeInsets.all(24),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             station.name.toUpperCase(),
  //             style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 10),
  //           Text(
  //             "Status: ${station.status == StationStatus.normal ? "Normal" : "INCIDENT"}",
  //             style: TextStyle(
  //               color: station.status == StationStatus.normal
  //                   ? Colors.green
  //                   : Colors.red,
  //             ),
  //           ),
  //           const SizedBox(height: 20),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
