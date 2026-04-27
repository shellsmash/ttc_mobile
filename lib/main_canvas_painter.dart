//
// import 'package:flutter/material.dart';
//
// import 'models/stations.dart';
//
//
//
//
// void main() => runApp(const TTCMapApp());
//
// class TTCMapApp extends StatelessWidget {
//   const TTCMapApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: const Color(0xFF121212),
//       ),
//       home: const SubwayMapScreen(),
//     );
//   }
// }
//
// class Station {
//   final String name;
//   final Offset pos;
//   final List<int> lines;
//   final bool isAccessible;
//
//   const Station({
//     required this.name,
//     required this.pos,
//     required this.lines,
//     this.isAccessible = true,
//   });
// }
//
// class SubwayMapScreen extends StatefulWidget {
//   const SubwayMapScreen({super.key});
//
//   @override
//   State<SubwayMapScreen> createState() => _SubwayMapScreenState();
// }
//
// class _SubwayMapScreenState extends State<SubwayMapScreen> {
//   final TransformationController _transformationController =
//   TransformationController();
//
//   final double canvasWidth = 2400;
//   final double canvasHeight = 3200;
//
//   void _handleTap(TapUpDetails details) {
//     final RenderBox box = context.findRenderObject() as RenderBox;
//
//     final Offset localOffset = box.globalToLocal(details.globalPosition);
//
//     final Offset sceneOffset = _transformationController.toScene(localOffset);
//
//     for (var station in allStations) {
//       double dist = (station.pos - sceneOffset).distance;
//       print("Station: ${station.name}, Tap Pos: $sceneOffset, Station Pos: ${station.pos}, Dist: $dist");
//       if (dist < 60) {
//         _showStationDetails(station);
//         return;
//       }
//     }
//   }
//
//   void _showStationDetails(Station station) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: const Color(0xFF1E1E1E),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//       ),
//       builder: (context) => Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               station.name.toUpperCase(),
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1.2,
//               ),
//             ),
//             const SizedBox(height: 15),
//             Row(
//               children: station.lines
//                   .map(
//                     (l) => Container(
//                   margin: const EdgeInsets.only(right: 10),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: _getLineColor(l),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Text(
//                     "LINE $l",
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               )
//                   .toList(),
//             ),
//             const Divider(height: 40, color: Colors.white24),
//             ListTile(
//               contentPadding: EdgeInsets.zero,
//               leading: Icon(
//                 Icons.accessible,
//                 color: station.isAccessible ? Colors.blue : Colors.grey,
//               ),
//               title: Text(
//                 station.isAccessible ? "Elevator Accessible" : "Stairs Only",
//               ),
//             ),
//             const ListTile(
//               contentPadding: EdgeInsets.zero,
//               leading: Icon(Icons.timer, color: Colors.green),
//               title: Text("Status: Normal Service"),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
//
//   static Color _getLineColor(int line) {
//     switch (line) {
//       case 1:
//         return const Color(0xFFFFCB0C);
//       case 2:
//         return const Color(0xFF009739);
//       case 4:
//         return const Color(0xFFA2428F);
//       case 5:
//         return const Color(0xFFF37021);
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TTC SYSTEM MAP'),
//         backgroundColor: Colors.black,
//         centerTitle: true,
//       ),
//       body: GestureDetector(
//         onTapUp: _handleTap,
//         behavior: HitTestBehavior.opaque,
//         child: InteractiveViewer(
//           transformationController: _transformationController,
//           boundaryMargin: const EdgeInsets.all(2000),
//           maxScale: 10.0,
//           minScale: 0.1,
//           constrained: false,
//
//           child: SizedBox(
//             width: canvasWidth,
//             height: canvasHeight,
//             child: CustomPaint(painter: SubwayPainter(stations: allStations)),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SubwayPainter extends CustomPainter {
//   final List<Station> stations;
//   SubwayPainter({required this.stations});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Map<int, Paint> linePaints = {
//       1: Paint()
//         ..color = const Color(0xFFFFCB0C)
//         ..strokeWidth = 8
//         ..style = PaintingStyle.stroke
//         ..strokeCap = StrokeCap.round,
//       2: Paint()
//         ..color = const Color(0xFF009739)
//         ..strokeWidth = 8
//         ..style = PaintingStyle.stroke
//         ..strokeCap = StrokeCap.round,
//       3: Paint()
//         ..color = const Color(0xFF00AADE)
//         ..strokeWidth = 8
//         ..style = PaintingStyle.stroke
//         ..strokeCap = StrokeCap.round,
//       4: Paint()
//         ..color = const Color(0xFFB32078)
//         ..strokeWidth = 8
//         ..style = PaintingStyle.stroke
//         ..strokeCap = StrokeCap.round,
//     };
//
//     for (int lineId in [1, 2, 3, 4]) {
//       final lineStations = stations
//           .where((s) => s.lines.contains(lineId))
//           .toList();
//       if (lineStations.isEmpty) continue;
//
//       final path = Path();
//       path.moveTo(lineStations.first.pos.dx, lineStations.first.pos.dy);
//
//       for (int i = 1; i < lineStations.length; i++) {
//         path.lineTo(lineStations[i].pos.dx, lineStations[i].pos.dy);
//       }
//
//       canvas.drawPath(path, linePaints[lineId]!);
//     }
//
//     for (var s in stations) {
//       final bool isTransfer = s.lines.length > 1;
//
//       canvas.drawCircle(
//         s.pos,
//         isTransfer ? 8 : 5,
//         Paint()..color = Colors.white,
//       );
//
//       canvas.drawCircle(
//         s.pos,
//         isTransfer ? 8 : 5,
//         Paint()
//           ..color = Colors.black
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 2,
//       );
//
//       final tp = TextPainter(
//         text: TextSpan(
//           text: s.name,
//           style: TextStyle(
//             fontSize: isTransfer ? 12 : 10,
//             color: Colors.white,
//             fontWeight: isTransfer ? FontWeight.bold : FontWeight.normal,
//             shadows: const [Shadow(blurRadius: 2, color: Colors.black)],
//           ),
//         ),
//         textDirection: TextDirection.ltr,
//       )..layout();
//
//       canvas.save();
//
//       canvas.translate(s.pos.dx, s.pos.dy);
//
//       canvas.rotate(-0.785398);
//
//       tp.paint(canvas, Offset(10, -tp.height / 2));
//
//       canvas.restore();
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
