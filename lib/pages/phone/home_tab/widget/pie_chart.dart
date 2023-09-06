import 'dart:math';

import 'package:flutter/cupertino.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Text('dsadasdasdsa'),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 16
      ..style = PaintingStyle.fill;
    final path = Path();

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );
    path.moveTo(size.width / 2, size.height / 2);
    // canvas.drawRRect(rect, paint);

    path.arcTo(rect, 0, pi, false);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HalfPieChart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final rect = Rect.fromCenter(
    //   center: Offset(size.width / 2, size.height / 2),
    //   width: size.width,
    //   height: size.height,
    // );
    final rect = RRect.fromLTRBAndCorners(0, 0, size.width, size.height,
        topLeft: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16), topRight: Radius.circular(16));
    final paint = Paint()
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    final path = Path();

    path.moveTo(size.width / 2, size.height / 2);
    canvas.drawRRect(rect, paint);
    path.arcTo(rect.safeInnerRect, 0, pi, false);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
