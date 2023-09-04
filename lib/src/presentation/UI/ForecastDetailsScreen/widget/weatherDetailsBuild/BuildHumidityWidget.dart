// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/core/BuildWeatherShapeWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BuildHumidityWidget extends StatelessWidget {

  final double dew_point ;
  final double humidity;
  final bool now;
  const BuildHumidityWidget({
    Key? key,
    required this.dew_point,
    required this.humidity,
    required this.now
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18 , fontWeight: FontWeight.bold);
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return  BuildWeatherShapeWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.humidity.toUpperCase() ,
              style: titleSmall,
            ),
            Text("${humidity.toStringAsFixed(0)}%" , style:  bodyLarge,),
            const Spacer(),
            Text(
                "${AppLocalizations.of(context)!.the_dew_point_is} ${dew_point.toInt()} "
                "${ now ? AppLocalizations.of(context)!.right_now : ""}.",
              style: bodySmall,
            )
          ],
        )
    );
  }
}
