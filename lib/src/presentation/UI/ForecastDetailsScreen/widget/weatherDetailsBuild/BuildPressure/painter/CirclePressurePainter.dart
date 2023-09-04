


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class CirclePressurePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Paint paint = Paint()
    ..strokeWidth=10
      ..style = PaintingStyle.stroke
    ..color = ColorService.greyTertiary;

    final w = size.width;
    final h = size.height;

    const u = pi/4/14;

    final rect = Rect.fromLTWH(0, 0, w, h);

    double startAngle = 0.0;

    for(int i = 0 ; i< 4*14 ; i++) {
      canvas.drawArc(rect, startAngle, u, false, paint);
      startAngle +=2*u ;
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}