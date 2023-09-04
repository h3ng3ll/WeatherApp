


import 'package:flutter/material.dart';

class BuildIcon extends StatelessWidget {
  
  final String iconPath;
  final BoxFit boxFit;
  final double? size;
  final double? width;
  final double? height;

  final bool isNetwork  ;

  const BuildIcon({
    Key? key,
    required this.iconPath,
    this.boxFit = BoxFit.none,
    this.size,
    this.width,
    this.height ,
    this.isNetwork = false
  }) : super(key: key);

  factory BuildIcon.network({
    required String iconPath,
    BoxFit? boxFit ,
    double? size,
    double? width,
    double? height,
  }) => BuildIcon(
      iconPath: iconPath,
      isNetwork: true,
      boxFit: boxFit ?? BoxFit.none,
      size:  size  ,
  ) ;

  @override
  Widget build(BuildContext context) {
    if(isNetwork) {
      return Image.network(
          iconPath,
          fit: boxFit,
          width: width ?? size  ,
          height: height ?? size,
      );
    } else {
      return Image.asset(
        "assets/$iconPath.png" ,
        fit: boxFit,
        width: width ?? size  ,
        height: height ?? size,
      );
    }

  }
}
