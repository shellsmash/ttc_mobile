# 🚇 TTC Subway Map - Quick Start (30 seconds)

## Run the App Right Now

```bash
cd /Volumes/Partition1/Development/Projects-Flutter/ttc
flutter run
```

**That's it!** The app will launch with an interactive TTC subway map.

---

## What You'll See

1. **Loading spinner** (1-2 seconds)
   - App is parsing GTFS station data
   
2. **Interactive map** with:
   - 🟨 **Line 1** (Yellow) - Yonge-University-Spadina
   - 🟩 **Line 2** (Green) - Bloor-Danforth
   - 🟪 **Line 4** (Purple) - Sheppard

3. **Station markers** at real Toronto locations

4. **Legend** at bottom showing colors

---

## Try These Interactions

| Action | How | Result |
|--------|-----|--------|
| **Pan** | Click and drag | Move around the map |
| **Zoom** | Scroll wheel | See more or less detail |
| **Select Station** | Click on marker | Info panel appears |
| **View Status** | Click info button | See if operational/disrupted |

---

## What's New This Version

✅ **Real GTFS Data**
- Loads actual TTC station coordinates
- 9,395 stops available
- Official colors from routes.txt

✅ **Async Loading**
- Smart loading spinner
- Works while data loads
- Error handling if needed

✅ **All Features Preserved**
- Pan/zoom still works
- Tap stations still works
- Legend still shows
- Colors accurate

---

## File Structure

```
Key files:
├── lib/services/ttc_data_service_new.dart    ← Loads GTFS data
├── lib/widgets/ttc_map_widget_new.dart       ← Interactive map
├── data/stops.txt                             ← Station coordinates
└── data/routes.txt                            ← Line colors
```

---

## Troubleshooting (2 Minutes)

### App won't start
```bash
flutter clean
flutter pub get
flutter run
```

### Shows "Error loading map data"
```bash
# Check data files exist
ls data/stops.txt

# Verify pubspec.yaml has assets
grep "data/stops.txt" pubspec.yaml

# Reinstall
flutter pub get
```

### Loading takes too long
- Normal on first run (CSV parsing 9000+ stops)
- Subsequent launches are faster
- ~1-2 seconds is expected

---

## Next Steps

### Want to improve it?
See: `README_COMPLETE.md` for features roadmap

### Want technical details?
See: `TECHNICAL_REFERENCE.md` for architecture

### Want implementation guide?
See: `GTFS_INTEGRATION.md` for how data loads

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `flutter run` | Launch app |
| `flutter run -v` | Launch with verbose logging |
| `flutter clean` | Clean build artifacts |
| `flutter pub get` | Install dependencies |

---

## Status

✅ **App is ready to use!**

Just run `flutter run` and enjoy your TTC subway map with real station data.

---

For more info: Check the other `.md` files in the project root.

