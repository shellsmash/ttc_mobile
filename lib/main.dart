import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:ttc/models/stations_v2.dart';
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
  late TTCMapGame game;

  @override
  void initState() {
    super.initState();
    game = TTCMapGame(
      stations: stationList,
      onStationTap: (station) => _showDetails(context, station),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TTC LIVE SYSTEM MAP'),
        backgroundColor: Colors.black,
      ),
      body: GameWidget(game: game),
    );
  }

  void _showDetails(BuildContext context, Station station) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station.name.toUpperCase(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Status: ${station.status == StationStatus.normal ? "Normal" : "INCIDENT"}",
              style: TextStyle(
                color: station.status == StationStatus.normal
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
