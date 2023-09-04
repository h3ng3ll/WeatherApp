


import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class CenterTabBarPaint extends CustomPainter{

  final Size size ;

  CenterTabBarPaint({super.repaint, required this.size});

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth=0.5
      ..color = ColorService.green;

    final path = clipCubic();
    canvas.drawPath(path, paint);
  }

  Path clipCubic() {

    final Path path  = Path();

    final  w = size.width;
    final  h = size.height;

    path.moveTo(0, h);
    path.cubicTo(
        w/4, h,
        w/2-w/3, 0,
        w/2-15, 0
    );
    path.lineTo(w/2+15, 0);

    path.cubicTo(
        w/2+w/3, 0,
        w-w/4, h,
        w, h
    );

    return path ;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}