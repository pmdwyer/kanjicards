import 'package:kanjicards/model/stroke.dart';

class Writing {
  Writing({required this.current, required this.existing});
  final Stroke current;
  final List<Stroke> existing;
}
