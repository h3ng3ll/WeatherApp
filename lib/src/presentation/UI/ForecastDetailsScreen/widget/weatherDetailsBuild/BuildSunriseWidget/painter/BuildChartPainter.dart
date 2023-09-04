


import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class BuildChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {




    final h = size.height;
    final w = size.width;

    buildChart(h , w ,   canvas);

    /// Chart build End

    /// Start build line
    final path = Path();
    final paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..color = ColorService.white.withOpacity(0.7);


    canvas.drawLine(Offset(0, h/2), Offset(w, h/2), paint);
    paint.color = ColorService.white;

    final circleCenter = Offset(w/4+6, h/2-7);
    const  radius= 6.0;
    /// build circle

    canvas.drawCircle(circleCenter, radius, paint);

    path.addOval(Rect.fromCenter(center: Offset(circleCenter.dx, circleCenter.dy-5), width: radius+20, height: radius+20));

    canvas.drawShadow(path, ColorService.purple3, 5, false);

  }


  void buildChart (double h , double w  , Canvas canvas) {


    final  path = Path() ;
    const  up = ColorService.gradientLightBlue1 ;
    const down = ColorService.gradientLightBlue2;

    final paint = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..color = down;

    path.moveTo(0, h);
    path.quadraticBezierTo(w/8, h-h/8, w/4, h/2);
    canvas.drawPath(path, paint);
    path.reset();

    path.moveTo(w/4, h/2);
    paint.color = up;
    path.cubicTo(w/2-10, -5, w/2+10, -5, w/2+w/4, h/2);
    canvas.drawPath(path, paint);
    path.reset();

    path.moveTo( w/2+w/4, h/2);
    paint.color = down;
    path.quadraticBezierTo(w/1.2, h/1.2, w, h);
    canvas.drawPath(path, paint);
    path.reset();

    path.close();
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}