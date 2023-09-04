


import 'package:flutter/cupertino.dart';
class TabBarShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {



    final path = Path();

    final  w = size.width;
    final  h = size.height;

    path.quadraticBezierTo(w/2, h/2+h/3, w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, 0);


    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}