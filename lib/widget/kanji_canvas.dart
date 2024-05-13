import 'package:flutter/cupertino.dart';
import 'package:kanjicards/widget/kanji_painter.dart';

import '../model/stroke.dart';
import '../model/writing.dart';

class KanjiCanvas extends StatefulWidget {
  const KanjiCanvas({
    super.key,
  });

  State<KanjiCanvas> createState() => _KanjiCanvas();
}

class _KanjiCanvas extends State<KanjiCanvas> {
  final Writing writing = Writing();
  Stroke currStroke = Stroke();

  void addPoint(Offset point) {
    setState(() {
      currStroke.addPoint(point);
    });
  }

  void finishStroke() {
    setState(() {
      writing.addStroke(currStroke);
      currStroke = Stroke();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);
        addPoint(offset);
      },
      onPointerMove: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);
        addPoint(offset);
      },
      onPointerUp: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);
        addPoint(offset);
        finishStroke();
      },
      child: RepaintBoundary(
        child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: CustomPaint(
            painter: KanjiPainter(writing: writing),
          ),
        ),
      ),
    );
  }
}
