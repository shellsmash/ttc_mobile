// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../models/ttc_line.dart';
//
// class TTCDataService {
//   static final TTCDataService _instance = TTCDataService._internal();
//
//   factory TTCDataService() {
//     return _instance;
//   }
//
//   TTCDataService._internal();
//
//   late List<TTCLine> _lines;
//   Map<String, Map<String, dynamic>> _stopsMap = {};
//
//   List<TTCLine> get lines => _lines;
//
//   Future<void> initialize() async {
//     // Load stops data from GTFS
//     await _loadStopsData();
//
//     _lines = [
//       _buildLine1(),
//       _buildLine2(),
//       _buildLine4(),
//     ];
//   }
//
//   Future<void> _loadStopsData() async {
//     try {
//       final String csvData = await rootBundle.loadString('data/stops.txt');
//       final List<String> lines = csvData.split('\n');
//
//       // Skip header
//       for (int i = 1; i < lines.length; i++) {
//         if (lines[i].isEmpty) continue;
//
//         try {
//           final List<String> fields = _parseCsvLine(lines[i]);
//           if (fields.length < 6) continue;
//
//           final String stopId = fields[0].trim();
//           final String stopName = fields[2].trim();
//           final double lat = double.tryParse(fields[4].trim()) ?? 0.0;
//           final double lon = double.tryParse(fields[5].trim()) ?? 0.0;
//
//           _stopsMap[stopId] = {
//             'name': stopName,
//             'lat': lat,
//             'lon': lon,
//           };
//         } catch (e) {
//           continue;
//         }
//       }
//       debugPrint('Loaded ${_stopsMap.length} stops from GTFS data');
//     } catch (e) {
//       debugPrint('Error loading stops data: $e');
//     }
//   }
//
//   List<String> _parseCsvLine(String line) {
//     List<String> fields = [];
//     StringBuffer current = StringBuffer();
//     bool inQuotes = false;
//
//     for (int i = 0; i < line.length; i++) {
//       String char = line[i];
//
//       if (char == '"') {
//         inQuotes = !inQuotes;
//       } else if (char == ',' && !inQuotes) {
//         fields.add(current.toString());
//         current.clear();
//       } else {
//         current.write(char);
//       }
//     }
//
//     fields.add(current.toString());
//     return fields;
//   }
//
//   /// Get actual station from stops map, with fallback to hardcoded data
//   Station _getStation(String stopName, String lineId, {double? fallbackLat, double? fallbackLon}) {
//     // First try to find by exact name match
//     for (var entry in _stopsMap.entries) {
//       if (entry.value['name'].toString().toLowerCase().contains(stopName.toLowerCase())) {
//         return Station(
//           name: entry.value['name'],
//           latitude: entry.value['lat'],
//           longitude: entry.value['lon'],
//           lineId: lineId,
//         );
//       }
//     }
//
//     // Fallback to hardcoded coordinates
//     return Station(
//       name: stopName,
//       latitude: fallbackLat ?? 43.6629,
//       longitude: fallbackLon ?? -79.3957,
//       lineId: lineId,
//     );
//   }
//
//   TTCLine _buildLine1() {
//     return TTCLine(
//       id: 'line1',
//       name: 'Line 1',
//       fullName: 'Yonge-University-Spadina',
//       color: Color(0xFFD5C82B),
//       stations: [
//         _getStation('Vaughan Metropolitan Centre', 'line1', fallbackLat: 43.8387, fallbackLon: -79.5056),
//         _getStation('Highway 407', 'line1', fallbackLat: 43.8304, fallbackLon: -79.5167),
//         _getStation('Steeles', 'line1', fallbackLat: 43.8046, fallbackLon: -79.4396),
//         _getStation('Finch', 'line1', fallbackLat: 43.7315, fallbackLon: -79.4008),
//         _getStation('Sheppard', 'line1', fallbackLat: 43.7193, fallbackLon: -79.4396),
//         _getStation('Dundas', 'line1', fallbackLat: 43.6658, fallbackLon: -79.3822),
//         _getStation('Wellesley', 'line1', fallbackLat: 43.6589, fallbackLon: -79.3822),
//         _getStation('Queen', 'line1', fallbackLat: 43.6527, fallbackLon: -79.3822),
//         _getStation('King', 'line1', fallbackLat: 43.6452, fallbackLon: -79.3822),
//         _getStation('Union', 'line1', fallbackLat: 43.6426, fallbackLon: -79.3871),
//         _getStation('St. Andrew', 'line1', fallbackLat: 43.6617, fallbackLon: -79.3957),
//         _getStation('Osgoode', 'line1', fallbackLat: 43.6616, fallbackLon: -79.3957),
//         _getStation('St. Patrick', 'line1', fallbackLat: 43.6630, fallbackLon: -79.3957),
//         _getStation('College', 'line1', fallbackLat: 43.6629, fallbackLon: -79.4008),
//         _getStation('Spadina', 'line1', fallbackLat: 43.6675, fallbackLon: -79.4008),
//         _getStation('Bathurst', 'line1', fallbackLat: 43.6789, fallbackLon: -79.4062),
//         _getStation('Bloor', 'line1', fallbackLat: 43.6809, fallbackLon: -79.3822),
//         _getStation('Summerhill', 'line1', fallbackLat: 43.6797, fallbackLon: -79.3957),
//         _getStation('Dundas West', 'line1', fallbackLat: 43.6636, fallbackLon: -79.4608),
//       ],
//     );
//   }
//
//   TTCLine _buildLine2() {
//     return TTCLine(
//       id: 'line2',
//       name: 'Line 2',
//       fullName: 'Bloor-Danforth',
//       color: Color(0xFF008000),
//       stations: [
//         _getStation('Kipling', 'line2', fallbackLat: 43.6414, fallbackLon: -79.4903),
//         _getStation('Dundas West', 'line2', fallbackLat: 43.6636, fallbackLon: -79.4608),
//         _getStation('Bathurst', 'line2', fallbackLat: 43.6789, fallbackLon: -79.4062),
//         _getStation('Spadina', 'line2', fallbackLat: 43.6675, fallbackLon: -79.4008),
//         _getStation('McCaul', 'line2', fallbackLat: 43.6710, fallbackLon: -79.3957),
//         _getStation('Bay', 'line2', fallbackLat: 43.6783, fallbackLon: -79.3871),
//         _getStation('Avenue Road', 'line2', fallbackLat: 43.6767, fallbackLon: -79.3902),
//         _getStation('Bloor-Yonge', 'line2', fallbackLat: 43.6809, fallbackLon: -79.3822),
//         _getStation('Wellesley', 'line2', fallbackLat: 43.6585, fallbackLon: -79.3822),
//         _getStation('College', 'line2', fallbackLat: 43.6629, fallbackLon: -79.3822),
//         _getStation('Queen', 'line2', fallbackLat: 43.6527, fallbackLon: -79.3822),
//         _getStation('King', 'line2', fallbackLat: 43.6452, fallbackLon: -79.3822),
//         _getStation('Broadview', 'line2', fallbackLat: 43.6658, fallbackLon: -79.3608),
//         _getStation('Chester', 'line2', fallbackLat: 43.6809, fallbackLon: -79.3403),
//         _getStation('Pape', 'line2', fallbackLat: 43.6809, fallbackLon: -79.3289),
//         _getStation('Donlands', 'line2', fallbackLat: 43.6809, fallbackLon: -79.3081),
//         _getStation('Greenwood', 'line2', fallbackLat: 43.6809, fallbackLon: -79.3167),
//         _getStation('Coxwell', 'line2', fallbackLat: 43.6809, fallbackLon: -79.3082),
//         _getStation('Woodbine', 'line2', fallbackLat: 43.6809, fallbackLon: -79.2950),
//         _getStation('Kennedy', 'line2', fallbackLat: 43.6809, fallbackLon: -79.2442),
//       ],
//     );
//   }
//
//   TTCLine _buildLine4() {
//     return TTCLine(
//       id: 'line4',
//       name: 'Line 4',
//       fullName: 'Sheppard',
//       color: Color(0xFFB300B3),
//       stations: [
//         _getStation('Kipling', 'line4', fallbackLat: 43.7312, fallbackLon: -79.4903),
//         _getStation('Dundas West', 'line4', fallbackLat: 43.7312, fallbackLon: -79.4608),
//         _getStation('Bathurst', 'line4', fallbackLat: 43.7312, fallbackLon: -79.4062),
//         _getStation('Spadina', 'line4', fallbackLat: 43.7312, fallbackLon: -79.4008),
//         _getStation('Avenue Road', 'line4', fallbackLat: 43.7312, fallbackLon: -79.3902),
//         _getStation('Bay', 'line4', fallbackLat: 43.7312, fallbackLon: -79.3871),
//         _getStation('Sheppard-Yonge', 'line4', fallbackLat: 43.7312, fallbackLon: -79.3822),
//         _getStation('Bayview', 'line4', fallbackLat: 43.7312, fallbackLon: -79.3608),
//         _getStation('Bessarion', 'line4', fallbackLat: 43.7312, fallbackLon: -79.3608),
//         _getStation('Leslie', 'line4', fallbackLat: 43.7312, fallbackLon: -79.3403),
//         _getStation('Don Mills', 'line4', fallbackLat: 43.7312, fallbackLon: -79.3289),
//         _getStation('Consumers Road', 'line4', fallbackLat: 43.7312, fallbackLon: -79.3118),
//         _getStation('McCowan', 'line4', fallbackLat: 43.7312, fallbackLon: -79.3024),
//         _getStation('Scarborough Centre', 'line4', fallbackLat: 43.7312, fallbackLon: -79.2401),
//       ],
//     );
//   }
// }
//
