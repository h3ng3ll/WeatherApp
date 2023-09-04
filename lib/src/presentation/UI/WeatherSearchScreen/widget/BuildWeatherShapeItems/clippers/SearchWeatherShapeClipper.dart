

import 'package:flutter/material.dart';

class SearchWeatherShapeClipper extends CustomClipper<Path> {

  final double radius ;

  SearchWeatherShapeClipper({super.reclip, required this.radius});

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => false;

  @override
  Path getClip(Size size) {

    final path = Path();

    final w = size.width;
    final h = size.height;



    path.moveTo(40, 0);
    path.lineTo(w-radius, h/2+1);

    path.arcToPoint(Offset(w, h/2+radius) , radius: Radius.circular(radius));

    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, 0);

    path.close();
    return path;

  }

}