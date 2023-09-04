
import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildPressure/painter/CirclePressurePainter.dart';
import 'package:weather_app/src/presentation/core/BuildWeatherShapeWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildPressureWidget extends StatelessWidget {
  final double pressure;
  const BuildPressureWidget({Key? key, required this.pressure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);
    final bodyLarge = Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24);


    return  BuildWeatherShapeWidget(
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.pressure.toUpperCase() ,
              style: titleSmall,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: size.height/7,
                width: size.height/7,
                child: CustomPaint(
                  painter: CirclePressurePainter(),
                  child: Center(child: Text(pressure.toStringAsFixed(0) , style:  bodyLarge,)),
                ),
              ),
            )
          ],
        )
    );
  }
}
