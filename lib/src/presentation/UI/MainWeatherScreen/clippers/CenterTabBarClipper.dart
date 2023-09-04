

import 'package:flutter/cupertino.dart';

class CenterTabBarClipper extends CustomClipper<Path>{
  final Size size ;

  CenterTabBarClipper({super.reclip, required this.size});

  @override
  Path getClip(Size size) {

    final path  = clipCubic();

    path.close();
    return path;
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

    // path.moveTo(0, h);
    //
    // path.quadraticBezierTo(w/16, h+10, w/8 , h-h/8);
    //
    // path.moveTo(w, h);

    // path.cubicTo(
    //     w4, h-h/4,
    //     w4-w8, h/4,
    //     w/3, 0
    // );
    //
    // path.lineTo(w-w/3-w16, 0);
    // path.cubicTo(
    //     w2+w4, h/16,
    //     w-w4, h-h/4,
    //     w, h
    // );

    path.lineTo(0, h);
    return path ;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}