

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/core/BuildWeatherShapeWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildFeelsLikeWidget extends StatelessWidget {

  final double feels_like;
  final double actual_temp;

  const BuildFeelsLikeWidget({Key? key, required this.feels_like, required this.actual_temp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return  BuildWeatherShapeWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.feels_like.toUpperCase() , style: titleSmall,),
            Text("$feels_like°" , style: bodyLarge,),
            const Spacer(),
            Text("${feelsLikeText(context)}." , style: bodySmall,)
          ],
        )
    );
  }

  String feelsLikeText(BuildContext context) {
    if(actual_temp == feels_like ){
      return AppLocalizations.of(context)!.similar_to_actual_temperature;
    } else if(feels_like - actual_temp >0){
      return "${AppLocalizations.of(context)!.higher_to_actual_temperature} "
          "${AppLocalizations.of(context)!.on} ${(feels_like - actual_temp).toStringAsFixed(1)}";
    } else {
      return "${AppLocalizations.of(context)!.lower_to_actual_temperature} "
          "${AppLocalizations.of(context)!.on} ${(actual_temp-feels_like).toStringAsFixed(1)}";
    }
  }
}
