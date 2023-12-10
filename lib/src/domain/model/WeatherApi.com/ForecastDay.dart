// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/AirQuality.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/Astro.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/ForecastAnHourOfDay.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/WeatherDetails.dart';
import 'package:weather_app/src/domain/repository/WeatherGeneral.dart';
import 'package:weather_app/src/domain/repository/WeatherDetailsMixin.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForecastDay extends WeatherGeneral with WeatherDetailsMixin {

  final double maxTemp;
  final double minTemp;

  /// average temperature
  final double avgtemp;
  final double maxwind_kph;
  final double totalprecip_mm;

  final double totalsnow_cm;
  final double avgvis_km;
  final double avghumidity;
  final bool will_it_rain;
  final bool will_it_snow;
  final int chance_of_rain;
  final int chance_of_snow;
  final Astro astro;
  final List<ForecastAnHourOfDay> hours;


  ForecastDay({
      required super.condition,
      required super.uv,
      required super.airQuality,
      required super.time,
      required this.maxTemp,
      required this.minTemp,
      required this.avgtemp,
      required this.maxwind_kph,
      required this.totalprecip_mm,
      required this.totalsnow_cm,
      required this.avgvis_km,
      required this.avghumidity,
      required this.will_it_rain,
      required this.will_it_snow,
      required this.chance_of_rain,
      required this.chance_of_snow,
      required this.astro,
      required this.hours,

  });

  static ForecastDay fromJson(Map<String, dynamic> json) {
    final day = json['day'];
    return ForecastDay(
        time: DateTime.fromMillisecondsSinceEpoch(json['date_epoch'] * 1000),
        maxTemp: day['maxtemp_c'],
        minTemp: day['mintemp_c'],
        avgtemp: day['avgtemp_c'],
        maxwind_kph: day['maxwind_kph'],
        totalprecip_mm: day['totalprecip_mm'],
        totalsnow_cm: day['totalsnow_cm'],
        avgvis_km: day['avgvis_km'],
        avghumidity: day['avghumidity'],
        will_it_rain: day['daily_will_it_rain'] == 1 ? true : false,
        will_it_snow: day['daily_will_it_snow'] == 1 ? true : false,
        chance_of_rain: day['daily_chance_of_rain'],
        chance_of_snow: day['daily_chance_of_snow'],
        uv: day['uv'],
        astro: Astro.fromJson(json['astro']),
        hours: List<ForecastAnHourOfDay>.from((json['hour'] as List<dynamic>)
            .map((e) => ForecastAnHourOfDay.fromJson(e))
            .toList()),
        condition: day['condition'],
        airQuality: AirQuality.fromJson(day[
            'air_quality']) // day['air_quality']['aqi_data'] != "null" ?  AirQuality.fromJson(day['air_quality']) : null

        );
  }

  @override
  WeatherDetails toWeatherDetails(BuildContext context) => WeatherDetails(
      time: DateFormat("EEE" , AppLocalizations.of(context)!.lang).format(time).toUpperCase(),
      conditionIcon: conditionIcon,
      conditionText: conditionText,
      willItRain: will_it_rain,
      willItSnow: will_it_snow,
      temp:  "$minTemp : $maxTemp",
      timeConfirm: time.day == DateTime.now().day
  );
}
