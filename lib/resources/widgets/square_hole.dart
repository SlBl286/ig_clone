import 'package:flutter/material.dart';

class HolePainter extends CustomPainter {
  final double width;

  HolePainter({required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.grey.withAlpha(220);
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()
          ..addRRect(RRect.fromLTRBR(0, 0, width, width, Radius.circular(0))),
        Path()
          ..addOval(Rect.fromCircle(
              center: Offset(width / 2, width / 2), radius: width - 200))
          ..close(),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
