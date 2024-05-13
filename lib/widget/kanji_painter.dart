import 'package:flutter/cupertino.dart';

import '../model/stroke.dart';
import '../model/writing.dart';

class KanjiPainter extends CustomPainter {
  final Writing writing;

  KanjiPainter({super.repaint, required this.writing});

  @override
  void paint(Canvas canvas, Size size) {
    for (Stroke s in writing.strokes) {
      final path = Path();
      path.moveTo(s.points.first.dx, s.points.first.dy);
      for (int i = 1; i < s.points.length - 1; i++) {
        path.lineTo(s.points[i].dx, s.points[i].dy);
      }
      Paint paint = Paint()
        ..style = PaintingStyle.stroke;
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}