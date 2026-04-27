// import 'package:flutter/material.dart';
//
// class Station {
//   final String name;
//   final double latitude;
//   final double longitude;
//   final String lineId;
//   bool isDisrupted;
//
//   Station({
//     required this.name,
//     required this.latitude,
//     required this.longitude,
//     required this.lineId,
//     this.isDisrupted = false,
//   });
// }
//
// class TTCLine {
//   final String id;
//   final String name;
//   final String fullName;
//   final Color color;
//   final List<Station> stations;
//
//   TTCLine({
//     required this.id,
//     required this.name,
//     required this.fullName,
//     required this.color,
//     required this.stations,
//   });
//
//   // Convenience getters
//   bool get hasDisruptions => stations.any((station) => station.isDisrupted);
//   Color get displayColor => hasDisruptions ? Colors.red : color;
// }
//
