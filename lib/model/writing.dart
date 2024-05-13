import 'package:kanjicards/model/stroke.dart';

class Writing {
  final List<Stroke> strokes = [];

  void addStroke(Stroke stroke) {
    strokes.add(stroke);
  }
}
