import 'package:flutter/cupertino.dart';
import 'package:kanjicards/widget/kanji_painter.dart';

import '../model/stroke.dart';
import '../model/writing.dart';

class KanjiCanvas extends StatefulWidget {
  const KanjiCanvas({
    super.key,
  });

  @override
  State<KanjiCanvas> createState() => _KanjiCanvas();
}

class _KanjiCanvas extends State<KanjiCanvas> {
  Writing writing = Writing(current: Stroke(points: []), existing: []);

  void updateWriting(Writing newWriting) {
    setState(() {
      writing = newWriting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);
        writing.current.points.add(offset);
        updateWriting(Writing(current: writing.current, existing: writing.existing));
      },
      onPointerMove: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);
        writing.current.points.add(offset);
        updateWriting(Writing(current: writing.current, existing: writing.existing));
      },
      onPointerUp: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);
        writing.current.points.add(offset);
        writing.existing.add(writing.current);
        updateWriting(Writing(current: Stroke(points: []), existing: writing.existing));
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
