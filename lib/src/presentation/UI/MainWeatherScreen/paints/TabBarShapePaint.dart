


import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class TabBarShapePaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth=0.5
      ..color = ColorService.green;

    final path = Path();

    final  w = size.width;
    final  h = size.height;

    path.quadraticBezierTo(w/2, h/2+h/3, w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}