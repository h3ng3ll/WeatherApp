

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildWindWidget/painter/BuildCompassCirclePaint.dart';
import 'package:weather_app/src/presentation/core/BuildWeatherShapeWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Direction { N , E , S, W,}

class BuildWindWidget extends StatelessWidget {
  final double windSpeed;
  final String direction;
  const BuildWindWidget({Key? key, required this.windSpeed, required this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);

    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    // final titleLarge = Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24 , fontWeight: FontWeight.bold);

    return  BuildWeatherShapeWidget(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.wind.toUpperCase() ,
                  style: titleSmall,
                ),
              ],
            ),
            Align(
              alignment: const Alignment(0 , 0.5),
              child: SizedBox(
                height: size.height/6,
                width: size.height/6,
                child: CustomPaint(
                  painter: BuildCompassCirclePaint(dirs: direction.characters.toString()),
                  child: Stack(
                    children: [

                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(windSpeed.toString() , style: bodyLarge?.copyWith(fontSize: 18),),
                            Text("km/h" , style: bodySmall!.copyWith(fontSize: 14)),
                          ],
                        ),
                      ),
                      ...buildDirectionsText(context),

                    ],
                  ),
                ),
              )
            ),
            // ...buildDirectionSigns(),
          ],
        )
    );
  }

  List<Widget> buildDirectionsText (BuildContext context) {
    final bodySmall = Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16);

    const  offset = 0.025;
    const  offset2 = 0.76;
    return [
      Align(
        alignment: const Alignment(offset, -offset2),
        child: Text("N" , style: bodySmall,),
      ),
      Align(
        alignment: const Alignment( -offset2, offset),
        child: Text("W" , style: bodySmall,),
      ),
      Align(
        alignment: const Alignment( offset2  , offset),
        child: Text("E" , style: bodySmall,),
      ),

      Align(
        alignment: const Alignment(offset  , offset2),
        child: Text("S" , style: bodySmall,),
      ),
    ];
  }



}

