


import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/core/BuildWeatherShapeWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildVisibilityWidget extends StatelessWidget {
  final double visibility;
  final bool now;
  final double currentVisibility;

  const BuildVisibilityWidget({Key? key, required this.visibility, required this.now, required this.currentVisibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18 , fontWeight: FontWeight.bold);
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return  BuildWeatherShapeWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.visibility.toUpperCase() , style: titleSmall,),
            const Spacer(),
            Text("${visibility.toStringAsFixed(0)} km" , style: bodyLarge,),
            const Spacer(),
            if(!now)Text( "${AppLocalizations.of(context)!.current_visibility_is} ${currentVisibility.toStringAsFixed(0)} ", style: bodySmall,)
          ],
        )
    );
  }
}
