

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

ThemeData defaultTheme = ThemeData(
  useMaterial3: true,
  dialogTheme: const DialogTheme(
    backgroundColor: ColorService.purpleShade2,
    titleTextStyle:  TextStyle(
      fontSize: 38 ,
      height: 1,
      color: ColorService.white,
      fontWeight: FontWeight.bold
    ),
    contentTextStyle:  TextStyle(
      color: ColorService.white ,
      height: 1,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    )
  ),
  fontFamily: "Sf-pro",
  sliderTheme: const SliderThemeData(
    thumbShape: RoundSliderThumbShape()
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: ColorService.white,
  ),
  textTheme:  TextTheme(
    titleLarge: const  TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      color: ColorService.white,
    ),
      /// subHeadline
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15,
      letterSpacing: -0.5,
      color: ColorService.grey,
    ),
    /// Title3
    titleSmall: const TextStyle(
      fontSize: 24,
      color: ColorService.greySecondary
    ),
    bodyLarge: const TextStyle(
        fontSize: 32 ,
        height: 1,
        color: ColorService.white,
        fontWeight: FontWeight.bold
    ),
    bodySmall: const TextStyle(
        color: ColorService.white ,
        height: 1,
        fontSize: 14,
        fontWeight: FontWeight.w500,
    )
  )
);