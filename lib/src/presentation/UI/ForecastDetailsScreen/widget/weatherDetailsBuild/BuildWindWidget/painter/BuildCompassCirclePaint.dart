import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildWindWidget/BuildWindWidget.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

/// 380 degree - 4 direction of world { N E S W}
/// 8 sectors (NE , ES or SE etc)
/// every sector has 14 gaps.
class BuildCompassCirclePaint extends CustomPainter {

  final  String dirs ;

  BuildCompassCirclePaint({super.repaint, required this.dirs});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = ColorService.greyQuaternary
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;

    /// width
    final double w = size.width;

    final arcsRect = Rect.fromLTWH(5, 7, w-8, w-8);
    const useCenter = false;


    /// unit sector
    const u = pi/4/28;

    double startAngle = u*2;

    for(int i = 0 ; i<8 ; i++)  {
      /// build sectors
      for(int j = 0 ; j<14 ; j++) {
        canvas.drawArc(arcsRect, startAngle, u, useCenter, paint);
        if(j < 13){
          startAngle += u*2;
        }
      }
      if(i%2 != 0){
        paint.color = ColorService.white;

      } else {
        paint.color = ColorService.greySecondary;
      }


      canvas.drawArc(arcsRect, startAngle, u, useCenter, paint);
      startAngle += u*2;
      paint.color = ColorService.greyQuaternary;
    }


    late Path path ;
    paint
    ..color = ColorService.white
    ..style = PaintingStyle.fill
    ..strokeWidth = 1;
    for (var char in dirs.characters) {

      switch(char) {
        case "S" : path = drawSome(Direction.S , size);
        case "W" : path = drawSome(Direction.W , size);
        case "E" : path = drawSome(Direction.E , size);
        case "N" : path = drawSome(Direction.N , size);
      }
      canvas.drawPath(path, paint);

    }
  }


  Path drawSome (Direction direction , Size size) {
    var w = size.width ;
    var h = size.height ;

    double offset = h*0.05;

    final Path path = Path();
    switch (direction){
      case Direction.E:
        h = size.height+h*0.065;
        w = size.width +w*0.03;
        path.moveTo(w, h/2);
        path.lineTo(w-offset, h/2-offset/1.5);
        path.lineTo(w-offset, h/2+offset/1.5);
        path.lineTo(w, h/2);
        break;
      case Direction.S:
        h = size.height + h*0.045;
        path.moveTo(w/2, h);
        path.lineTo(w/2+offset/1.5, h-offset);
        path.lineTo(w/2-offset/1.5, h-offset);
        path.lineTo(w/2, h);
        break;
      case Direction.N:
        w = w +w*0.033;

        path.moveTo(w/2, 0);
        path.lineTo(w/2+offset/1.5, offset);
        path.lineTo(w/2-offset/1.5, offset);
        path.lineTo(w/2, 0);
        break;
      case Direction.W:
        h = h + h*0.039;
        w = w - w*0.04;
        path.moveTo(0, h/2);
        path.lineTo(offset, h/2-offset/1.5);
        path.lineTo(offset, h/2+offset/1.5);
        path.lineTo(0, h/2);
        break;
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}
