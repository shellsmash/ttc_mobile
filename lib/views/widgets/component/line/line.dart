import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

abstract class TransitLineComponent extends Component with TapCallbacks {
  final Color lineColor;
  final List<Vector2> waypoints;
  final double strokeWidth;

  late final Path linePath;
  late final Paint linePaint;
  late final Paint glowPaint;

  late final Paint stationPaint;
  late final Paint disabledStationPaint;

  bool isGlowing = false;

  TransitLineComponent({
    required this.lineColor,
    required this.waypoints,
    this.strokeWidth = 10.0,
  });

  @override
  void render(Canvas canvas) {
    if (isGlowing) {
      canvas.drawPath(linePath, glowPaint);
    }
    canvas.drawPath(linePath, linePaint);
    for (final waypoint in waypoints) {
      final offset = Offset(waypoint.x, waypoint.y);
      canvas.drawCircle(offset, strokeWidth * 0.8, stationPaint);
      canvas.drawCircle(offset, strokeWidth * 0.8, stationPaint);
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    final siblings = parent?.children.whereType<TransitLineComponent>() ?? [];

    if (isGlowing) {
      for (final line in siblings) {
        line.isGlowing = false;
      }
    } else {
      for (final line in siblings) {
        if (line == this) {
          line.isGlowing = true;
        } else {
          line.isGlowing = false;
        }
      }
    }
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    // super.onTapCancel(event);
    isGlowing = !isGlowing;
  }

  /// Flame defaults to bounding-box hit detection.
  /// We override this to do exact point-to-polyline distance checking.
  @override
  bool containsLocalPoint(Vector2 point) {
    // Add a padding multiplier so the user's finger doesn't have to be pixel-perfect
    final hitThreshold = strokeWidth * 1.5;

    for (int i = 0; i < waypoints.length - 1; i++) {
      if (_distancePointToSegment(point, waypoints[i], waypoints[i + 1]) <=
          hitThreshold) {
        return true;
      }
    }
    return false;
  }

  /// Calculates the shortest distance from a point [p] to a line segment [a]-[b]
  double _distancePointToSegment(Vector2 p, Vector2 a, Vector2 b) {
    final l2 = a.distanceToSquared(b);
    if (l2 == 0) return p.distanceTo(a); // a == b case

    // Calculate projection scalar
    var t = ((p.x - a.x) * (b.x - a.x) + (p.y - a.y) * (b.y - a.y)) / l2;
    t = t.clamp(0.0, 1.0);

    // Find the closest point on the segment
    final projection = Vector2(a.x + t * (b.x - a.x), a.y + t * (b.y - a.y));

    return p.distanceTo(projection);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    glowPaint = Paint()
      ..color = lineColor.withOpacity(0.8)
      ..strokeWidth = strokeWidth * 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8.0);

    stationPaint = Paint()
      ..color =
          const Color(0xFFFFFFFF) // White inner circle
      ..style = PaintingStyle.fill;

    disabledStationPaint = Paint()
      ..color = const Color(0xFFFFFFFF)
          .withOpacity(0.2) // Dimmed white
      ..style = PaintingStyle.fill;

    linePath = Path();
    if (waypoints.isNotEmpty) {
      linePath.moveTo(waypoints.first.x, waypoints.first.y);
      for (int i = 1; i < waypoints.length; i++) {
        addStop(waypoints[i]);
      }
    }
  }

  void addStop(Vector2 waypoint) {
    linePath.lineTo(waypoint.x, waypoint.y);
  }

  /// Calculates [stationCount] coordinates equally distributed across the entire path.
  /// Uses dart:ui PathMetrics for exact contour tracking.
  List<Vector2> calculateEquidistantStations(int stationCount) {
    if (stationCount <= 1) return waypoints.isNotEmpty ? [waypoints.first] : [];

    final metrics = linePath.computeMetrics().toList();
    if (metrics.isEmpty) return [];

    final totalLength = metrics.fold<double>(0, (sum, m) => sum + m.length);
    final spacing = totalLength / (stationCount - 1);

    List<Vector2> stations = [];

    for (int i = 0; i < stationCount; i++) {
      double currentTarget = i * spacing;
      double distanceAccumulated = 0.0;

      for (var metric in metrics) {
        if (distanceAccumulated + metric.length >= currentTarget ||
            metric == metrics.last) {
          final localDistance = (currentTarget - distanceAccumulated).clamp(
            0.0,
            metric.length,
          );
          final tangent = metric.getTangentForOffset(localDistance);
          if (tangent != null) {
            stations.add(Vector2(tangent.position.dx, tangent.position.dy));
          }
          break;
        }
        distanceAccumulated += metric.length;
      }
    }
    return stations;
  }
}
