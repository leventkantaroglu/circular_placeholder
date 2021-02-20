library circular_placeholder;

import 'dart:math';

import 'package:flutter/material.dart';

class CircularPlaceholder extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  CircularPlaceholder({this.color, this.strokeWidth});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints boxConstraints) {
        var _size = min(boxConstraints.maxWidth, boxConstraints.maxHeight);
        return Center(
          child: CustomPaint(
            painter: _OpenPainter(
              size: _size,
              strokeWidth: strokeWidth,
              color: color,
            ),
          ),
        );
      },
    );
  }
}

class _OpenPainter extends CustomPainter {
  final double size;
  final double strokeWidth;
  final Color color;
  _OpenPainter({
    @required this.size,
    this.strokeWidth,
    this.color,
  });
  @override
  void paint(Canvas canvas, Size _) {
    var paint1 = Paint()
      ..color = color ?? const Color(0xFF455A64)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? 2;

    canvas.rotate(pi / 4);
    canvas.translate(-size / 2, -size / 2);

    canvas.drawOval(Rect.fromLTRB(0, 0, size, size), paint1);
    canvas.drawLine(Offset(size / 2, 0), Offset(size / 2, size), paint1);
    canvas.drawLine(Offset(0, size / 2), Offset(size, size / 2), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
