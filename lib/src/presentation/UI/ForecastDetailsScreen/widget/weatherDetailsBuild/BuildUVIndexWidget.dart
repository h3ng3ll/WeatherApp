

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/core/BuildIndicatorLine.dart';
import 'package:weather_app/src/presentation/core/BuildWeatherShapeWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///
class BuildUVIndexWidget extends StatelessWidget {
  final int index;
  final String uvDescription;
  const BuildUVIndexWidget({Key? key, required this.index, required this.uvDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18 , fontWeight: FontWeight.w700);
    final titleLarge = Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24 , fontWeight: FontWeight.bold);
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;


    return BuildWeatherShapeWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("UV ${AppLocalizations.of(context)!.index.toUpperCase()}" , style: titleSmall,),
            SizedBox(height: size.height*0.02,),
            Text(index.toString() , style: bodyLarge),
            Text(uvDescription , style: titleLarge),
            const Spacer(),
            BuildIndicatorLine(value: index.toDouble(), maxValue: 11),
            const Spacer(),
          ],
        )
    );
  }
}
