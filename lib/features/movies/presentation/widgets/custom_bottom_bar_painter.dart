import 'package:flutter/material.dart';

/// CustomBottomBarPainter is used to draw the custom bottom bar
class CustomBottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 1.010000);
    path_0.lineTo(size.width * 1.003139, size.height * 1.010000);
    path_0.lineTo(size.width * 1.002632, size.height * 0.9983890);
    path_0.lineTo(size.width * 0.9658080, size.height * 0.1526080);
    path_0.cubicTo(size.width * 0.9622293, size.height * 0.07038070, size.width * 0.9432853, size.height * 0.01000000,
        size.width * 0.9210667, size.height * 0.01000000);
    path_0.lineTo(size.width * 0.07893227, size.height * 0.01000000);
    path_0.cubicTo(size.width * 0.05671467, size.height * 0.01000000, size.width * 0.03777120, size.height * 0.07038060,
        size.width * 0.03419120, size.height * 0.1526070);
    path_0.lineTo(size.width * -0.002631821, size.height * 0.9983890);
    path_0.lineTo(size.width * -0.003137360, size.height * 1.010000);
    path_0.lineTo(0, size.height * 1.010000);
    path_0.lineTo(size.width, size.height * 1.010000);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.005333333;
    paint0Stroke.color = const Color(0xffE5E5EA).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffF2F2F7).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
