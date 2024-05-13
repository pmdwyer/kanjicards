import 'dart:ui';

class Stroke {
  final List<Offset> points = [];

  void addPoint(Offset point) {
    points.add(point);
  }
}