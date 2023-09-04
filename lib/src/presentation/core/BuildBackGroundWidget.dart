


import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class BuildBackGroundWidget extends StatelessWidget {

  final Widget child;
  final EdgeInsets? padding;
  const BuildBackGroundWidget({
    Key? key,
    required this.child,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: padding,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorService.gradientDarkBlue1 ,
                ColorService.gradientDarkBlue2
              ]
          )
      ),
      width: size.width,
      height: size.height,
      child: child
    );
  }
}
