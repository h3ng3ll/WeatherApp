

import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/widget/BuildWeatherShapeItems/clippers/SearchWeatherShapeClipper.dart';
import 'package:weather_app/src/presentation/core/BuildIcon.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';


class BuildWeatherShapeItem extends StatelessWidget {
  const BuildWeatherShapeItem({Key? key, required this.weather}) : super(key: key);

  final Weather weather;
  final  double radius = 25;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 50 , fontWeight: FontWeight.w400);
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18 , fontWeight: FontWeight.w400);
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return  Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ClipPath(
            clipper: SearchWeatherShapeClipper(radius: radius),
            child: Container(
               padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      ColorService.gradientDarkPurple1,
                      ColorService.gradientDarkPurple2,
                    ]
                )
              ),
              width: size.width,
              height: size.height/4.1,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${weather.now.temp.round()}°" , style: bodyLarge,),
                  const Spacer(),
                  Text("H:${weather.forecastDay!.first.maxTemp.round()}°   "
                      "L:${weather.forecastDay!.first.minTemp.round()}° ",
                      style:  titleSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "${weather.location.name}, ${weather.location.country}" ,
                          style: bodyLarge?.copyWith(fontSize: 18),
                        ),
                      ),
                      Text("${weather.now.condition['text']}" , style: bodySmall),
                    ],
                  )
                  // Spacer(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: 0,
          child: BuildIcon(
            iconPath: "https:${weather.now.condition['icon']}" ,
            size: size.height/3.8,
            isNetwork: true,
            boxFit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
