

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class BuildWeatherShapeWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets insidePadding;

  const BuildWeatherShapeWidget({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(0),
    this.insidePadding = const EdgeInsets.all(15),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
        padding: padding,
        child: Container(
          padding: insidePadding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.5),
              border: Border.all(color: ColorService.purpleSolid , width: 1.5),
              color: ColorService.blackSolid
          ),
          width: size.width,
          child: child
        )
    );
  }
}
