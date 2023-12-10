

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:weather_app/src/data/WeatherRepository.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildAirQualityWidget/AirQualityWidget.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildFeelsLikeWidget.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildHumidityWidget.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildPressure/BuildPressureWidget.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildRainfallWidget.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildSunriseWidget/BuildSunriseWidget.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildUVIndexWidget.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildVisibilityWidget.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/weatherDetailsBuild/BuildWindWidget/BuildWindWidget.dart';

class BuildForecastItems extends StatelessWidget {

  final bool hourlyForecast;
  final bool weeklyForecast;

  final double uv;
  final String? sunrise;
  final String? sunset;
  final double wind_kph;
  final String? wind_dir;
  final double precip_mm;
  final double expectedPrecip;
  final double? feelslike_c;
  final double? actual_temp;
  final double? dew_point;
  final double humidity;
  final double visibility;
  final double currentVisibility;
  final double? pressure;
  final bool now;
  const BuildForecastItems({
    Key? key,
    this.hourlyForecast = false,
    this.weeklyForecast = false,
    required this.uv,
    required this.sunrise,
    required this.sunset,
    required this.wind_kph,
    required this.wind_dir,
    required this.precip_mm,
    required this.expectedPrecip,
    required this.feelslike_c,
    required this.actual_temp,
    required this.dew_point,
    required this.humidity,
    required this.visibility,
    required this.pressure,
    this.now = false,
    required this.currentVisibility,
  }) : assert (
     hourlyForecast == true && weeklyForecast ==  false ||
      hourlyForecast == false && weeklyForecast == true
  ) , super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [

         const AirQualityWidget(),

        SizedBox(height: size.height*0.02,),

        GridView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          shrinkWrap: true,
          children: [
            BuildUVIndexWidget(
              index: uv.toInt(),
              uvDescription: WeatherRepository.translateUIIndex(uv.toInt(), context)!,
            ),
            if(sunset != null || sunrise != null )
            BuildSunriseWidget(
              sunrise: sunrise!,
              sunset: sunset!,
            ),

            if(wind_dir != null ) BuildWindWidget(
              windSpeed: wind_kph,
              direction: wind_dir!,
            ),

            BuildRainfallWidget(
              precip_mm: precip_mm,
              expectedPrecip: expectedPrecip,
            ),
            if(feelslike_c != null && actual_temp != null)BuildFeelsLikeWidget(
              feels_like: feelslike_c!,
              actual_temp: actual_temp!,
            ),
            if(dew_point != null ) BuildHumidityWidget(
              dew_point: dew_point!,
              humidity: humidity, now: now,
            ),
            BuildVisibilityWidget(
              visibility: visibility,
              now:  now,
              currentVisibility: currentVisibility,
            ),
            if(pressure != null ) BuildPressureWidget(pressure: pressure!,),
          ],
        ),
        const SizedBox(height: 20 )
      ],
    );
  }
}
