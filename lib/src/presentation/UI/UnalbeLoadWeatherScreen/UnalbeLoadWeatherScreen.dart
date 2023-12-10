



import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';
import 'package:weather_app/src/presentation/core/BuildBackGroundWidget.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UnableLoadWeatherScreen extends StatelessWidget {

  final Function () update;
  final AsyncSnapshot<Forecast> snapshot;
  const UnableLoadWeatherScreen({Key? key, required this.snapshot, required this.update}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return BuildBackGroundWidget(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.sms_went_wrong , style:  bodyLarge,),
              const SizedBox(height: 10,),

              Text(AppLocalizations.of(context)!.dates_has_not_been_loaded , style:  bodySmall,),
              const SizedBox(height: 15,),

              // Text(snapshot.error.toString() , style:  bodySmall,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(AppLocalizations.of(context)!.internet_errors ,
                  style: bodySmall?.copyWith(color: ColorService.lightPink , fontSize: 18),
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: update,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.5),
                    gradient: const LinearGradient(colors: [
                      ColorService.gradientLightBlue11,
                      ColorService.gradientPink22,
                    ])
                  ),
                  child: Text(AppLocalizations.of(context)!.update , style: bodySmall,)
                ),
              )
            ]
        )
    );
  }


}
