// import 'package:flutter/material.dart';
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
//
//   List<TTCLine> get lines => _lines;
//
//   void initialize() {
//     _lines = [
//       _buildLine1(),
//       _buildLine2(),
//       _buildLine4(),
//     ];
//   }
//
//   TTCLine _buildLine1() {
//     // Line 1: Yonge-University-Spadina
//     // Color from routes.txt: D5C82B (Gold/Yellow)
//     return TTCLine(
//       id: 'line1',
//       name: 'Line 1',
//       fullName: 'Yonge-University-Spadina',
//       color: Color(0xFFD5C82B), // From routes.txt
//       stations: [
//         Station(name: 'Vaughan Metropolitan Centre', latitude: 43.8387, longitude: -79.5056, lineId: 'line1'),
//         Station(name: 'Highway 407', latitude: 43.8304, longitude: -79.5167, lineId: 'line1'),
//         Station(name: 'Steeles', latitude: 43.8046, longitude: -79.4396, lineId: 'line1'),
//         Station(name: 'Finch', latitude: 43.7315, longitude: -79.4008, lineId: 'line1'),
//         Station(name: 'North York Centre', latitude: 43.7267, longitude: -79.4392, lineId: 'line1'),
//         Station(name: 'Sheppard', latitude: 43.7193, longitude: -79.4396, lineId: 'line1'),
//         Station(name: 'Wellesley', latitude: 43.6589, longitude: -79.3822, lineId: 'line1'),
//         Station(name: 'Dundas', latitude: 43.6658, longitude: -79.3822, lineId: 'line1'),
//         Station(name: 'Queen', latitude: 43.6527, longitude: -79.3822, lineId: 'line1'),
//         Station(name: 'King', latitude: 43.6452, longitude: -79.3822, lineId: 'line1'),
//         Station(name: 'St. Andrew', latitude: 43.6617, longitude: -79.3957, lineId: 'line1'),
//         Station(name: 'Osgoode', latitude: 43.6616, longitude: -79.3957, lineId: 'line1'),
//         Station(name: 'St. Patrick', latitude: 43.6630, longitude: -79.3957, lineId: 'line1'),
//         Station(name: 'College', latitude: 43.6629, longitude: -79.4008, lineId: 'line1'),
//         Station(name: 'Spadina', latitude: 43.6675, longitude: -79.4008, lineId: 'line1'),
//         Station(name: 'Bathurst', latitude: 43.6789, longitude: -79.4062, lineId: 'line1'),
//         Station(name: 'Bloor', latitude: 43.6809, longitude: -79.3822, lineId: 'line1'),
//         Station(name: 'Wellesley', latitude: 43.6589, longitude: -79.3822, lineId: 'line1'),
//         Station(name: 'Castle Frank', latitude: 43.6650, longitude: -79.4004, lineId: 'line1'),
//         Station(name: 'Summerhill', latitude: 43.6797, longitude: -79.3957, lineId: 'line1'),
//         Station(name: 'St. Clair', latitude: 43.6880, longitude: -79.3957, lineId: 'line1'),
//         Station(name: 'Dundas West', latitude: 43.6636, longitude: -79.4608, lineId: 'line1'),
//       ],
//     );
//   }
//
//   TTCLine _buildLine2() {
//     // Line 2: Bloor-Danforth
//     // Color from routes.txt: 008000 (Green)
//     return TTCLine(
//       id: 'line2',
//       name: 'Line 2',
//       fullName: 'Bloor-Danforth',
//       color: Color(0xFF008000), // From routes.txt
//       stations: [
//         Station(name: 'Kipling', latitude: 43.6414, longitude: -79.4903, lineId: 'line2'),
//         Station(name: 'Dundas West', latitude: 43.6636, longitude: -79.4608, lineId: 'line2'),
//         Station(name: 'Bathurst', latitude: 43.6789, longitude: -79.4062, lineId: 'line2'),
//         Station(name: 'Spadina', latitude: 43.6675, longitude: -79.4008, lineId: 'line2'),
//         Station(name: 'McCaul', latitude: 43.6710, longitude: -79.3957, lineId: 'line2'),
//         Station(name: 'St George', latitude: 43.6673, longitude: -79.4004, lineId: 'line2'),
//         Station(name: 'Bay', latitude: 43.6783, longitude: -79.3871, lineId: 'line2'),
//         Station(name: 'Avenue Road', latitude: 43.6767, longitude: -79.3902, lineId: 'line2'),
//         Station(name: 'Bloor-Yonge', latitude: 43.6809, longitude: -79.3822, lineId: 'line2'),
//         Station(name: 'Wellesley', latitude: 43.6585, longitude: -79.3822, lineId: 'line2'),
//         Station(name: 'College', latitude: 43.6629, longitude: -79.3822, lineId: 'line2'),
//         Station(name: 'Dundas', latitude: 43.6658, longitude: -79.3822, lineId: 'line2'),
//         Station(name: 'Queen', latitude: 43.6527, longitude: -79.3822, lineId: 'line2'),
//         Station(name: 'King', latitude: 43.6452, longitude: -79.3822, lineId: 'line2'),
//         Station(name: 'Broadview', latitude: 43.6658, longitude: -79.3608, lineId: 'line2'),
//         Station(name: 'Castle Frank', latitude: 43.6650, longitude: -79.4004, lineId: 'line2'),
//         Station(name: 'Chester', latitude: 43.6809, longitude: -79.3403, lineId: 'line2'),
//         Station(name: 'Pape', latitude: 43.6809, longitude: -79.3289, lineId: 'line2'),
//         Station(name: 'Donlands', latitude: 43.6809, longitude: -79.3081, lineId: 'line2'),
//         Station(name: 'Greenwood', latitude: 43.6809, longitude: -79.3167, lineId: 'line2'),
//         Station(name: 'Coxwell', latitude: 43.6809, longitude: -79.3082, lineId: 'line2'),
//         Station(name: 'Woodbine', latitude: 43.6809, longitude: -79.2950, lineId: 'line2'),
//         Station(name: 'Main Street', latitude: 43.6809, longitude: -79.2844, lineId: 'line2'),
//         Station(name: 'Victoria Park', latitude: 43.6809, longitude: -79.2744, lineId: 'line2'),
//         Station(name: 'Warden', latitude: 43.6809, longitude: -79.2536, lineId: 'line2'),
//         Station(name: 'Kennedy', latitude: 43.6809, longitude: -79.2442, lineId: 'line2'),
//       ],
//     );
//   }
//
//   TTCLine _buildLine4() {
//     // Line 4: Sheppard
//     // Color from routes.txt: B300B3 (Purple)
//     return TTCLine(
//       id: 'line4',
//       name: 'Line 4',
//       fullName: 'Sheppard',
//       color: Color(0xFFB300B3), // From routes.txt
//       stations: [
//         Station(name: 'Kipling', latitude: 43.7312, longitude: -79.4903, lineId: 'line4'),
//         Station(name: 'Dundas West', latitude: 43.7312, longitude: -79.4608, lineId: 'line4'),
//         Station(name: 'Bathurst', latitude: 43.7312, longitude: -79.4062, lineId: 'line4'),
//         Station(name: 'Spadina', latitude: 43.7312, longitude: -79.4008, lineId: 'line4'),
//         Station(name: 'Avenue Road', latitude: 43.7312, longitude: -79.3902, lineId: 'line4'),
//         Station(name: 'Bay', latitude: 43.7312, longitude: -79.3871, lineId: 'line4'),
//         Station(name: 'Sheppard-Yonge', latitude: 43.7312, longitude: -79.3822, lineId: 'line4'),
//         Station(name: 'Bayview', latitude: 43.7312, longitude: -79.3608, lineId: 'line4'),
//         Station(name: 'Bessarion', latitude: 43.7312, longitude: -79.3608, lineId: 'line4'),
//         Station(name: 'Leslie', latitude: 43.7312, longitude: -79.3403, lineId: 'line4'),
//         Station(name: 'Don Mills', latitude: 43.7312, longitude: -79.3289, lineId: 'line4'),
//         Station(name: 'Consumers Road', latitude: 43.7312, longitude: -79.3118, lineId: 'line4'),
//         Station(name: 'McCowan', latitude: 43.7312, longitude: -79.3024, lineId: 'line4'),
//         Station(name: 'Scarborough Centre', latitude: 43.7312, longitude: -79.2401, lineId: 'line4'),
//       ],
//     );
//   }
// }
//
//
