// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/AirQuality.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/WeatherDetails.dart';
import 'package:weather_app/src/domain/repository/WeatherGeneral.dart';
import 'package:weather_app/src/domain/repository/WeatherDetailsMixin.dart';

class ForecastNow extends WeatherGeneral with WeatherDetailsMixin  {
  final double temp;
  final double wind_kph;
  final int wind_degree;
  final String wind_dir;
  final double pressure_mb;
  final double precip_mm;
  final double humidity;
  final double feelslike_c;
  final double vis_km;
  // final int cloud;
  // final double gust_mph;


  ForecastNow( {
    required super.time,
    required super.condition,
    required super.airQuality,
    required super.uv,
    required this.temp,
    required this.wind_kph,
    required this.wind_degree,
    required this.wind_dir,
    required this.pressure_mb,
    required this.precip_mm,
    required this.humidity,
    // required this.cloud,
    required this.feelslike_c,
    required this.vis_km,
    // required this.gust_mph
  });

  static ForecastNow fromJson(Map<String , dynamic> json) => ForecastNow(
      condition: json['condition'],
      temp: json['temp_c'],
      wind_kph: json['wind_kph'],
      wind_degree: json['wind_degree'],
      wind_dir: json['wind_dir'],
      pressure_mb: json['pressure_mb'],
      precip_mm: json['precip_mm'],
      humidity: json['precip_mm'],
      // cloud: json['cloud'],
      feelslike_c: json['feelslike_c'],
      vis_km: json['vis_km'],
      uv: json['uv'],
      // gust_mph: json['gust_mph'],
      airQuality: AirQuality.fromJson(json['air_quality']),
      time: DateTime.now(),
  );

  @override
  WeatherDetails toWeatherDetails (BuildContext context) {
    return WeatherDetails(
      time: AppLocalizations.of(context)!.now,
      conditionIcon: conditionIcon,
      conditionText: conditionText,
      willItRain: false,
      willItSnow: false,
      temp: temp.round().toString(),
      timeConfirm: true
    );
  }
}