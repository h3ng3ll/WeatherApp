



import 'package:flutter/material.dart';

enum AnimationDirection {
 left,
 right
}

class AppRoutes {

  static Route createAnimatedRoute ({
    required Widget page ,
    required AnimationDirection dir
  }) {
    return PageRouteBuilder(
        pageBuilder: (context , animation , secondaryAnimation) => page,
        transitionsBuilder: (context , animation , secondaryAnimation , child) {

          late final  Offset begin;
          late final  Offset end;
          switch (dir) {
            case AnimationDirection.left:
              begin = const Offset(1 , 0);
              end = const Offset(0 , 0);
              break;
            case AnimationDirection.right:
              begin = const Offset(-1 , 0);
              end = const Offset(0 , 0);
              break;
          }
          const curve = Curves.ease;

          final tween = Tween(begin: begin , end:  end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween) ,
            child:  child,
          );
        }
    );
  }
}