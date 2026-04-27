# TTC Subway Status Map Implementation

## Overview
This Flutter application displays an interactive map of Toronto's TTC subway lines with station markers and disruption status indicators.

## Features

### Current Implementation
✅ **Interactive Map Display**
- Custom-drawn TTC subway map using Canvas
- Three subway lines displayed:
  - **Line 1 (Yellow)**: Yonge-University-Spadina
  - **Line 2 (Green)**: Bloor-Danforth
  - **Line 4 (Purple)**: Sheppard

✅ **Station Visualization**
- Station markers with color-coded borders
- Station names and operational status
- White markers for operational stations
- Red markers for disrupted stations

✅ **Interactive Features**
- **Pan/Drag**: Move around the map
- **Zoom**: Use mouse scroll or pinch to zoom in/out
- **Tap Station**: Click on any station to view details
- **Station Info Panel**: Shows station name and disruption status

✅ **Legend Widget**
- Visual reference for line colors
- Disruption status indicator
- Located at bottom of screen

## Project Structure

```
lib/
├── main.dart                          # Main app entry point
├── models/
│   └── ttc_line.dart                 # Data models for Lines and Stations
├── services/
│   └── ttc_data_service.dart         # TTC data initialization and management
└── widgets/
    └── ttc_map_widget.dart           # Interactive map rendering
```

## Data Models

### Station
- `name`: Station name
- `latitude`, `longitude`: Geographic coordinates
- `lineId`: Associated TTC line ID
- `isDisrupted`: Boolean flag for disruption status

### TTCLine
- `id`: Unique line identifier (line1, line2, line4)
- `name`: Display name (Line 1, Line 2, etc.)
- `fullName`: Full line name (Yonge-University-Spadina, etc.)
- `color`: Line color (Yellow, Green, Purple)
- `stations`: List of stations on the line
- `displayColor`: Color property that shows red if line has disruptions

## Map Implementation Details

### Coordinate System
- Uses Toronto's geographic bounds (43.5°N to 43.9°N, -79.7°W to -79.0°W)
- Converts latitude/longitude to pixel coordinates for canvas rendering
- Supports zoom and pan transformations

### Rendering
- **Lines**: Drawn using polylines connecting stations
- **Stations**: Circular markers with line-color borders
- **Grid**: Optional grid overlay for reference

### Interactivity
- Click stations to view detailed information
- Pan to explore different areas
- Zoom to adjust detail level
- Station selection shows operational status

## How to Use

### Add a Station
In `ttc_data_service.dart`, add a new Station to a line's station list:

```dart
Station(
  name: 'Station Name',
  latitude: 43.xxxx,
  longitude: -79.xxxx,
  lineId: 'line1'
)
```

### Mark Station as Disrupted
```dart
Station(
  name: 'Station Name',
  latitude: 43.xxxx,
  longitude: -79.xxxx,
  lineId: 'line1',
  isDisrupted: true  // This will turn the marker red
)
```

### Modify Line Colors
In `TTCLine` constructor, change the `color` parameter:

```dart
color: Color(0xFFYourColorCode), // Hex color code
```

## Future Enhancements

### Planned Features
- [ ] Real-time TTC API integration for live disruption data
- [ ] Route planning between stations
- [ ] Accessibility information display
- [ ] Service schedule integration
- [ ] Crowding/capacity indicators
- [ ] Multiple line view with customizable visibility
- [ ] Dark mode support
- [ ] Search functionality for stations
- [ ] Line 3 (Scarborough RT) support when needed

### Technical Improvements
- [ ] Replace custom canvas with proper mapping library
- [ ] Add touch-friendly station selection
- [ ] Implement proper coordinate projection
- [ ] Add animation for state transitions
- [ ] Performance optimization for large datasets

## Dependencies
- flutter: SDK framework
- cupertino_icons: Icon library

## Running the App

```bash
# Get dependencies
flutter pub get

# Run the app
flutter run

# Run in release mode
flutter run --release
```

## Architecture Notes

### Widget Hierarchy
```
MyApp
└── TTCStatusPage
    └── Scaffold
        ├── AppBar
        └── Stack
            ├── TTCMapWidget
            │   ├── CustomPaint (TTCMapPainter)
            │   └── Station Info Panel (conditional)
            └── TTCLegendWidget
```

### Data Flow
1. `TTCDataService` initializes all lines and stations
2. `TTCMapWidget` reads data from service
3. `TTCMapPainter` renders lines and stations on canvas
4. User interactions update selection state in `TTCMapWidget`
5. Info panel updates based on selected station

## Customization Guide

### Changing Map Colors
Edit `_buildLineX()` methods in `ttc_data_service.dart`:
```dart
color: Color(0xFFFFCC00), // Line color (hex format)
```

### Adjusting Zoom Limits
In `TTCMapWidget._TTCMapWidgetState`:
```dart
_zoom = _zoom.clamp(0.5, 3.0); // Change zoom range
```

### Modifying Geographic Bounds
In `TTCMapPainter`:
```dart
static const double minLat = 43.5;  // Change boundaries
static const double maxLat = 43.9;
static const double minLng = -79.7;
static const double maxLng = -79.0;
```

## Support

For station details and coordinate information, place a `stations.json` file in the assets folder with the following format:

```json
{
  "lines": [
    {
      "id": "line1",
      "stations": [
        {
          "name": "Station Name",
          "latitude": 43.xxxx,
          "longitude": -79.xxxx
        }
      ]
    }
  ]
}
```

Then update `ttc_data_service.dart` to load from this file instead of hardcoded data.

