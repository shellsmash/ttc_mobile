# TTC Subway Status Alert App - Quick Start Guide

## What's Been Built ✅

A fully functional **interactive TTC subway map** in Flutter that displays:

### Map Features
- **3 TTC Subway Lines** rendered with accurate colors:
  - 🟨 **Line 1 (Yellow)**: Yonge-University-Spadina
  - 🟩 **Line 2 (Green)**: Bloor-Danforth  
  - 🟪 **Line 4 (Purple)**: Sheppard

- **Station Visualization**:
  - White markers = Operational stations
  - Red markers = Disrupted stations
  - Color-coded borders matching line colors

### Interactive Controls
- **Pan**: Click and drag to move around the map
- **Zoom**: Use mouse scroll to zoom in/out
- **Tap Stations**: Click any station to see details
- **Info Panel**: Shows station name and disruption status

### UI Components
- **Top Bar**: App title and navigation
- **Legend Widget**: Visual reference for line colors and disruption status (bottom of screen)
- **Station Info Panel**: Appears when you tap a station

## Project Structure

```
lib/
├── main.dart                    # App entry point & UI
├── models/
│   └── ttc_line.dart           # Station & TTCLine models
├── services/
│   └── ttc_data_service.dart   # Data initialization
├── widgets/
│   └── ttc_map_widget.dart     # Interactive map rendering
└── data/
    └── ttc_stations_data.dart  # Station reference data
```

## How to Test

1. **Run the app**:
   ```bash
   cd /Volumes/Partition1/Development/Projects-Flutter/ttc
   flutter pub get
   flutter run
   ```

2. **Try interactions**:
   - Drag to pan the map
   - Scroll to zoom in/out
   - Click on a station marker to see its details
   - Check the legend at the bottom

## Next Steps

### 1. Add More Stations
Edit `ttc_data_service.dart` and add stations to any line:

```dart
Station(
  name: 'Davisville',
  latitude: 43.7068,
  longitude: -79.3957,
  lineId: 'line1'
)
```

### 2. Mark Stations as Disrupted
```dart
Station(
  name: 'Bloor',
  latitude: 43.6809,
  longitude: -79.3822,
  lineId: 'line1',
  isDisrupted: true  // Will show as red
)
```

### 3. Integrate Real TTC Data
Replace hardcoded data with API calls:

```dart
// In ttc_data_service.dart
Future<void> fetchLiveDisruptions() async {
  // Call TTC API endpoint
  // Update station.isDisrupted based on response
}
```

### 4. Add Missing Lines
The infrastructure is ready for Line 3 (Scarborough RT):

```dart
TTCLine _buildLine3() {
  return TTCLine(
    id: 'line3',
    name: 'Line 3',
    fullName: 'Scarborough RT',
    color: Color(0xFF0099FF), // Blue
    stations: [...], // Add stations
  );
}
```

## Customization Examples

### Change Line 2 to a Different Color
```dart
// In _buildLine2()
color: Color(0xFFFF6B6B), // Change to red
```

### Adjust Map Zoom Limits
```dart
// In TTCMapWidget._TTCMapWidgetState
_zoom = _zoom.clamp(0.3, 5.0); // Allow more zoom
```

### Change Map Geographic Bounds
```dart
// In TTCMapPainter
static const double minLat = 43.4;  // Zoom out further
static const double maxLat = 44.0;
static const double minLng = -80.0;
static const double maxLng = -78.5;
```

## Current Limitations & Future Improvements

### Known Limitations
- Station coordinates are approximate
- No real-time TTC API integration yet
- No route planning between stations
- Limited touch support on some devices

### Planned Enhancements
- [ ] Real-time TTC API integration
- [ ] Route planning (A to B)
- [ ] Accessibility information
- [ ] Service schedules
- [ ] Crowding indicators
- [ ] Search functionality
- [ ] Dark mode
- [ ] Offline map caching

## File Reference

| File | Purpose |
|------|---------|
| `main.dart` | Main app shell, page structure, legend widget |
| `models/ttc_line.dart` | Station & TTCLine data models |
| `services/ttc_data_service.dart` | Initialize & manage TTC data |
| `widgets/ttc_map_widget.dart` | Interactive map with canvas rendering |
| `data/ttc_stations_data.dart` | Reference station coordinates |
| `IMPLEMENTATION_GUIDE.md` | Detailed implementation documentation |

## Station Data Format

Each station requires:
- `name`: Station name (string)
- `latitude`: Geographic latitude (43.5-43.9)
- `longitude`: Geographic longitude (-79.7 to -79.0)
- `lineId`: Line ID (line1, line2, line4)
- `isDisrupted`: Disruption status (boolean, optional)

## Performance Notes

- Map renders up to ~60 stations smoothly
- Pan/zoom operations are responsive
- Station selection uses proximity detection (15px radius)
- No external dependencies required for map rendering

## Support

For detailed implementation information, see `IMPLEMENTATION_GUIDE.md`.

For station coordinates reference, check `lib/data/ttc_stations_data.dart`.

## Getting Live TTC Data

When ready to integrate real TTC disruption data:

1. TTC provides public transit data through:
   - GTFS (General Transit Feed Specification) feeds
   - Real-time alerts through their API
   - Third-party transit apps use TTC's public data

2. You'll need to:
   - Parse disruption alerts
   - Match them to station IDs
   - Update `station.isDisrupted` flag
   - Refresh the UI

Example implementation in progress - ask for details!

---

**Happy mapping! 🚇**

