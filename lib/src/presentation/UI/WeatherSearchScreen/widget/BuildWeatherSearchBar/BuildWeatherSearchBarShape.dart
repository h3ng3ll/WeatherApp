

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class BuildWeatherSearchBarShape extends StatelessWidget {

  final Widget child;
  const BuildWeatherSearchBarShape({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size =  MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.5),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
               const Color(0xFF2e335a42).withOpacity(0.1),
               const Color(0xFF1c1b3342).withOpacity(0.26),

            ]
        ),
        boxShadow: [
          BoxShadow(
            color: ColorService.black.withOpacity(0.4),
            spreadRadius: 6,
            blurRadius: 4,
            blurStyle: BlurStyle.inner,
            offset: const Offset(0, -3),
          ),
        ]
      ),
      height: size.height*0.06,
      width: size.width,
      child: child,
    );
  }
}
