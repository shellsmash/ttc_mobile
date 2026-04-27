// import 'package:csv/csv.dart';
//
// class GTFSParser {
//   /// Parse stops.txt to extract subway stations for a specific route
//   /// Returns a list of (stop_name, lat, lon) tuples
//   static Future<List<Map<String, dynamic>>> parseSubwayStops(String csvData, {String? routeId}) async {
//     List<List<dynamic>> rows = const CsvToListConverter().convert(csvData);
//
//     if (rows.isEmpty) return [];
//
//     // Header: stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,stop_timezone,wheelchair_boarding
//     List<Map<String, dynamic>> stops = [];
//
//     for (int i = 1; i < rows.length; i++) {
//       try {
//         List<dynamic> row = rows[i];
//         if (row.length < 6) continue;
//
//         stops.add({
//           'stop_id': row[0],
//           'stop_name': row[2].toString().trim(),
//           'stop_lat': double.tryParse(row[4].toString()) ?? 0.0,
//           'stop_lon': double.tryParse(row[5].toString()) ?? 0.0,
//         });
//       } catch (e) {
//         // Skip malformed rows
//         continue;
//       }
//     }
//
//     return stops;
//   }
//
//   /// Extract subway stations from stop_times that belong to specific routes
//   static Future<List<String>> getStopsForRoute(
//     String stopsData,
//     String stopTimesData,
//     String tripsData,
//     String routeId,
//   ) async {
//     // This would require parsing all three files together
//     // For now, we'll use a simpler approach with stop_times grouping
//
//     List<List<dynamic>> stopTimesRows = const CsvToListConverter().convert(stopTimesData);
//     List<List<dynamic>> tripsRows = const CsvToListConverter().convert(tripsData);
//
//     Set<String> stopIds = {};
//
//     // Find all trips for this route
//     Set<String> tripIds = {};
//     for (int i = 1; i < tripsRows.length; i++) {
//       try {
//         List<dynamic> row = tripsRows[i];
//         if (row.length < 3) continue;
//         if (row[0].toString() == routeId) {
//           tripIds.add(row[2].toString()); // trip_id is at index 2
//         }
//       } catch (e) {
//         continue;
//       }
//     }
//
//     // Get all stops for these trips, maintaining order
//     List<String> orderedStops = [];
//     for (int i = 1; i < stopTimesRows.length; i++) {
//       try {
//         List<dynamic> row = stopTimesRows[i];
//         if (row.length < 2) continue;
//
//         String tripId = row[0].toString();
//         String stopId = row[3].toString();
//
//         if (tripIds.contains(tripId) && !stopIds.contains(stopId)) {
//           stopIds.add(stopId);
//           orderedStops.add(stopId);
//         }
//       } catch (e) {
//         continue;
//       }
//     }
//
//     return orderedStops;
//   }
// }
//
