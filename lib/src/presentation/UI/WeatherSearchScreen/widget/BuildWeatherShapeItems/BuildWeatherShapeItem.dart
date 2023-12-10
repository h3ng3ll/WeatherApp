import 'package:flutter/material.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/src/data/services/locale/hive/gelocationHive/geolocation_hive.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/dialogs/DecorationDialog.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/widget/BuildWeatherShapeItems/clippers/SearchWeatherShapeClipper.dart';
import 'package:weather_app/src/presentation/core/BuildIcon.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildWeatherShapeItem extends StatelessWidget {
  const BuildWeatherShapeItem({Key? key, required this.weather})
      : super(key: key);

  final Forecast weather;
  final double radius = 25;

  void onTap(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final actions = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24);

    DecorationDialog.showMyDialog(context,
        child: Column(
          children: [
            const Spacer(),
            Text(   AppLocalizations.of(context)!.glob_location_changing_desc , style:  bodyLarge?.copyWith(fontSize: 18),),
            const Spacer(),
            Text(
                  AppLocalizations.of(context)!.are_you_sure_to_do_this + " ?",
                  style:  bodyLarge?.copyWith(color: ColorService.pinkSolid , fontSize: 23)
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.close,
                      style: actions,
                    )),
                TextButton(
                    onPressed: () {
                      box.put("geolocation", GeolocationHive(lat: weather.location.lat, lon: weather.location.lon , townName: weather.location.name));
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.changes_applied_successfully)));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.ok,
                      style: actions,
                    ))
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bodyLarge = Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(fontSize: 50, fontWeight: FontWeight.w400);
    final titleSmall = Theme.of(context)
        .textTheme
        .titleSmall
        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w400);
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return InkWell(
      onTap: () => onTap(context),
      child: Stack(
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
                        ])),
                width: size.width,
                height: size.height / 4.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${weather.now.temp.round()}°",
                      style: bodyLarge,
                    ),
                    const Spacer(),
                    Text(
                      "H:${weather.forecastDay!.first.maxTemp.round()}°   "
                      "L:${weather.forecastDay!.first.minTemp.round()}° ",
                      style: titleSmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "${weather.location.name}, ${weather.location.country}",
                            style: bodyLarge?.copyWith(fontSize: 18),
                          ),
                        ),
                        Text(weather.now.conditionText, style: bodySmall),
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
              iconPath: "https:${weather.now.conditionIcon}",
              size: size.height / 3.8,
              isNetwork: true,
              boxFit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
