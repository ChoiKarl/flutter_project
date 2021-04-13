import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'CustomPaint',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: KLCustomPaint(),
  ));
}

class KLCustomPaint extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<KLCustomPaint> {
  Path path = Path();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('CustomPaint'),
      ),
      body: Center(
        child: GestureDetector(
          onPanStart: (start) {
            setState(() {
              path.moveTo(start.localPosition.dx, start.localPosition.dy);
            });
          },
          onPanUpdate: (update) {
            print(update.localPosition);
            setState(() {
              path.lineTo(update.localPosition.dx, update.localPosition.dy);
            });
          },
          child: CustomPaint(
            painter: KLPainter(path),
            size: MediaQuery.of(context).size,
          ),
        ),
      ),
    );
  }
}

class KLPainter extends CustomPainter {
  final Path path;

  KLPainter(this.path);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    canvas.save();
    canvas.restore();

    Paint paint1 = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
