




// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/core/BuildWeatherShapeWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildRainfallWidget extends StatelessWidget {
  final double precip_mm;
  final double expectedPrecip;

  const BuildRainfallWidget({Key? key, required this.precip_mm, required this.expectedPrecip}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18 , fontWeight: FontWeight.w700);
    final titleLarge = Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24 , fontWeight: FontWeight.bold);
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;


    return  BuildWeatherShapeWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.rainfall.toUpperCase() , style: titleSmall,),
            Text("$precip_mm mm" , style: bodyLarge, ),
            Text(AppLocalizations.of(context)!.in_last_hour , style: titleLarge, ),
            const Spacer(),
            Text("$expectedPrecip mm ${AppLocalizations.of(context)!.expected_in_next_24h }.", style: bodySmall,)
          ],
        )
    );
  }
}
