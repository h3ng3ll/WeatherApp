

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildSunriseWidget/painter/BuildChartPainter.dart';
import 'package:weather_app/src/presentation/core/BuildWeatherShapeWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildSunriseWidget extends StatelessWidget {

  final String sunrise;
  final String sunset;
  const BuildSunriseWidget({Key? key, required this.sunrise, required this.sunset}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 27);

    return  BuildWeatherShapeWidget(
        insidePadding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0 , left: 15 , right: 15 , bottom: 25),
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.sunrise.toUpperCase() , style: titleSmall,),
                  Text(sunrise , style:  bodyLarge,),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: size.width,
                child: CustomPaint(
                  painter: BuildChartPainter(),
                ),
              ),
            ),
               Padding(
              padding: const EdgeInsets.only(top: 10.0 , left: 15 , right: 15 , bottom: 15),
              child: Text("${AppLocalizations.of(context)!.sunset}: $sunset" , style:  bodySmall,),
            ),
          ],
        )
    );
  }
}
