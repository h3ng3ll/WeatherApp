


import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class BuildMovementLine extends StatelessWidget {
  final bool removeColor;
  const BuildMovementLine({
    Key? key,
    this.alignment = const Alignment(0,-0.9),
    this.removeColor = false,
  }) : super(key: key);

  final Alignment alignment ;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Align(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          color: !removeColor  ? ColorService.black.withOpacity(0.7) : null,
          boxShadow: [
            BoxShadow(
              color: ColorService.black.withOpacity(0.3),
              blurStyle: BlurStyle.inner,
              offset: const Offset(2 , -2),
            )
          ],
          borderRadius: BorderRadius.circular(25)
        ),
        height: 6,
        width: size.width/8,

      ),
    );
  }
}
