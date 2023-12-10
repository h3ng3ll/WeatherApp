

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildAirQualityWidget/BuildSeeMoreAQ.dart';
import 'package:weather_app/src/presentation/core/BuildIndicatorLine.dart';
import 'package:weather_app/src/presentation/core/BuildWeatherShapeWidget.dart';
import 'package:weather_app/src/presentation/provider/WeatherProvider.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AirQualityWidget extends StatefulWidget {


   const AirQualityWidget({Key? key}) : super(key: key);

  @override
  State<AirQualityWidget> createState() => _AirQualityWidgetState();
}

class _AirQualityWidgetState extends State<AirQualityWidget> {
  bool visibleAQDetails = false;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);
    final titleLarge = Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24 , fontWeight: FontWeight.bold);

    final provider = Provider.of<WeatherProvider>(context , listen: false);

    return BuildWeatherShapeWidget(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.air_quality , style:  titleSmall,),
          Text("${provider.weather.now.airQuality!.getHealthRisk(context)} ${AppLocalizations.of(context)!.health_risk}" , style:  titleLarge,),
          SizedBox(height: size.height*0.025,),

          BuildIndicatorLine(value: provider.weather.now.airQuality!.us_epa_index!.toDouble(), maxValue: 6,),
          SizedBox(height: size.height*0.025,),

          const Divider(height: 0.5 , color: ColorService.purple,),


          SizedBox(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => setState(() =>  visibleAQDetails = !visibleAQDetails),
                    child: Text(
                        AppLocalizations.of(context)!.see_more ,
                        style: titleLarge?.copyWith(fontSize: 18 , fontWeight: FontWeight.w400)
                    )
                ),
                const Spacer(),
                IconButton(
                    onPressed: () => setState(() =>  visibleAQDetails = !visibleAQDetails),
                    icon:   Transform.rotate(
                        angle: visibleAQDetails ? pi/2 : 0,
                        child: const Icon(Icons.arrow_forward_ios ,color: ColorService.greyTertiary, ))
                )
              ],
            ),
          ),
          Visibility(
              visible: visibleAQDetails,
              child: BuildSeeMoreAQ()
          )
        ],
      ),
    );
  }
}
