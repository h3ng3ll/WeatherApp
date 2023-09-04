
import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class BuildIndicatorLine extends StatelessWidget {

  final double value ;
  final double maxValue;
  final Color transparentColor;

  const BuildIndicatorLine({
    Key? key,
    required this.value,
    required this.maxValue,
    this.transparentColor = ColorService.blackSolid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    const double height = 7;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                  colors: [
                    ColorService.gradientLightBlue11,
                    ColorService.gradientPink22,
                    ColorService.lightPink
                  ]
              )
          ),
          height: height,
          width: size.width,
        ),
        Positioned(
          child: Row(
            children: [
              if(maxValue != 0)Spacer(flex: value.toInt(),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: transparentColor,
                      spreadRadius: 2.5
                    )
                  ],
                  color: ColorService.white,
                ),
                height: height,
                width: height,
              ),
              if(maxValue != value)Spacer(flex: maxValue.toInt()-value.toInt(),)
            ],
          ),
        )
      ],
    );
  }
}
