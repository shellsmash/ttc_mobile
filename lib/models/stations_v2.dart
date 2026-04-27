import 'package:flame/components.dart';

enum StationStatus { normal, securityIncident }

class Station {
  final String name;
  final Vector2 pos;
  final List<int> lines;
  final bool isAccessible;
  StationStatus status;

  Station({
    required this.name,
    required this.pos,
    required this.lines,
    this.isAccessible = true,
    this.status = StationStatus.normal,
  });
}

final List<Station> stationList = [
  // --- LINE 1: YONGE-UNIVERSITY (U-Shape) ---
  Station(name: "Vaughan MC", pos: Vector2(150, 50), lines: [1]),
  Station(name: "Highway 407", pos: Vector2(150, 100), lines: [1]),
  Station(name: "Pioneer Village", pos: Vector2(150, 150), lines: [1]),
  Station(name: "York University", pos: Vector2(150, 200), lines: [1]),
  Station(name: "Finch West", pos: Vector2(150, 250), lines: [1]),
  Station(name: "Downsview Park", pos: Vector2(150, 300), lines: [1]),
  Station(name: "Sheppard West", pos: Vector2(150, 350), lines: [1]),
  Station(name: "Wilson", pos: Vector2(150, 400), lines: [1]),
  Station(name: "Yorkdale", pos: Vector2(175, 450), lines: [1]),
  Station(name: "Lawrence West", pos: Vector2(200, 500), lines: [1]),
  Station(name: "Glencairn", pos: Vector2(225, 550), lines: [1]),
  Station(name: "Eglinton West", pos: Vector2(250, 600), lines: [1]),
  Station(name: "St Clair West", pos: Vector2(275, 650), lines: [1]),
  Station(name: "Dupont", pos: Vector2(300, 700), lines: [1]),
  Station(name: "Spadina", pos: Vector2(325, 800), lines: [1, 2]),
  Station(name: "St George", pos: Vector2(400, 800), lines: [1, 2]),
  Station(name: "Museum", pos: Vector2(400, 850), lines: [1]),
  Station(name: "Queen's Park", pos: Vector2(400, 900), lines: [1]),
  Station(name: "St Patrick", pos: Vector2(400, 950), lines: [1]),
  Station(name: "Osgoode", pos: Vector2(400, 1000), lines: [1]),
  Station(name: "St Andrew", pos: Vector2(400, 1050), lines: [1]),
  Station(name: "Union", pos: Vector2(500, 1100), lines: [1]),
  Station(name: "King", pos: Vector2(600, 1050), lines: [1]),
  Station(name: "Queen", pos: Vector2(600, 1000), lines: [1]),
  Station(name: "Dundas", pos: Vector2(600, 950), lines: [1]),
  Station(name: "College", pos: Vector2(600, 900), lines: [1]),
  Station(name: "Wellesley", pos: Vector2(600, 850), lines: [1]),
  Station(
    name: "Bloor-Yonge",
    pos: Vector2(600, 800),
    lines: [1, 2],
    status: StationStatus.securityIncident,
  ),
  Station(name: "Rosedale", pos: Vector2(600, 750), lines: [1]),
  Station(name: "Summerhill", pos: Vector2(600, 700), lines: [1]),
  Station(name: "St Clair", pos: Vector2(600, 650), lines: [1]),
  Station(name: "Davisville", pos: Vector2(600, 600), lines: [1]),
  Station(name: "Eglinton", pos: Vector2(600, 550), lines: [1]),
  Station(name: "Lawrence", pos: Vector2(600, 500), lines: [1]),
  Station(name: "York Mills", pos: Vector2(600, 450), lines: [1]),
  Station(name: "Sheppard-Yonge", pos: Vector2(600, 400), lines: [1, 4]),
  Station(name: "North York Centre", pos: Vector2(600, 350), lines: [1]),
  Station(name: "Finch", pos: Vector2(600, 300), lines: [1]),

  // --- LINE 2: BLOOR-DANFORTH ---
  Station(name: "Kipling", pos: Vector2(25, 800), lines: [2]),
  Station(name: "Islington", pos: Vector2(75, 800), lines: [2]),
  Station(name: "Royal York", pos: Vector2(125, 800), lines: [2]),
  Station(name: "Old Mill", pos: Vector2(175, 800), lines: [2]),
  Station(name: "Jane", pos: Vector2(225, 800), lines: [2]),
  Station(name: "Runnymede", pos: Vector2(275, 800), lines: [2]),
  Station(name: "Bay", pos: Vector2(500, 800), lines: [2]),
  Station(name: "Sherbourne", pos: Vector2(650, 800), lines: [2]),
  Station(name: "Castle Frank", pos: Vector2(700, 800), lines: [2]),
  Station(name: "Broadview", pos: Vector2(750, 800), lines: [2]),
  Station(name: "Chester", pos: Vector2(800, 800), lines: [2]),
  Station(name: "Pape", pos: Vector2(850, 800), lines: [2]),
  Station(name: "Donlands", pos: Vector2(900, 800), lines: [2]),
  Station(name: "Greenwood", pos: Vector2(950, 800), lines: [2]),
  Station(name: "Coxwell", pos: Vector2(1000, 800), lines: [2]),
  Station(name: "Woodbine", pos: Vector2(1050, 800), lines: [2]),
  Station(name: "Main Street", pos: Vector2(1100, 800), lines: [2]),
  Station(name: "Victoria Park", pos: Vector2(1150, 800), lines: [2]),
  Station(name: "Warden", pos: Vector2(1200, 800), lines: [2]),
  Station(name: "Kennedy", pos: Vector2(1250, 800), lines: [2, 3]),

  // --- LINE 3: SCARBOROUGH ---
  Station(name: "Lawrence East", pos: Vector2(1250, 750), lines: [3]),
  Station(name: "Ellesmere", pos: Vector2(1250, 700), lines: [3]),
  Station(name: "Midland", pos: Vector2(1250, 650), lines: [3]),
  Station(name: "Scarborough Centre", pos: Vector2(1300, 600), lines: [3]),
  Station(name: "McCowan", pos: Vector2(1350, 600), lines: [3]),

  // --- LINE 4: SHEPPARD ---
  Station(name: "Bayview", pos: Vector2(650, 400), lines: [4]),
  Station(name: "Bessarion", pos: Vector2(700, 400), lines: [4]),
  Station(name: "Leslie", pos: Vector2(750, 400), lines: [4]),
  Station(name: "Don Mills", pos: Vector2(800, 400), lines: [4]),
];
