


// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/AirQuality.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/WeatherDetails.dart';
import 'package:weather_app/src/domain/repository/WeatherGeneral.dart';
import 'package:weather_app/src/domain/repository/WeatherDetailsMixin.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForecastAnHourOfDay extends WeatherGeneral implements WeatherDetailsMixin{
  final double temp ;
  final bool is_day;
  final double wind_kph;
  final int wind_degree;
  final String wind_dir;
  final double pressure_mb;
  final double precip_mm;
  final double humidity;
  final int cloud ;
  final double feels_like ;
  final double windchill ;
  final double heatindex ;
  final bool willItRain ;
  final bool willItSnow ;
  final int chance_of_rain ;
  final int chance_of_snow ;
  final double vis_km ;
  final double gust_mph ;
  final double dewPoint;


  ForecastAnHourOfDay({
    required super.uv,
    required super.airQuality,
    required super.condition,
    required super.time,
    required this.dewPoint,
    required this.temp,
    required this.is_day,
    required this.wind_kph,
    required this.wind_degree,
    required this.wind_dir,
    required this.pressure_mb,
    required this.precip_mm,
    required this.humidity,
    required this.cloud,
    required this.feels_like,
    required this.windchill,
    required this.heatindex,
    required this.willItRain,
    required this.willItSnow,
    required this.chance_of_rain,
    required this.chance_of_snow,
    required this.vis_km,
    required this.gust_mph,

  });

  static fromJson (Map<String , dynamic>json ) => ForecastAnHourOfDay(
      time: DateTime.fromMillisecondsSinceEpoch(json['time_epoch'] * 1000),
      temp: json['temp_c'],
      is_day: json['is_day'] == 1 ? true : false,
      condition: json['condition'],
      wind_kph: json['wind_kph'],
      wind_degree: json['wind_degree'],
      wind_dir: json['wind_dir'],
      pressure_mb: json['pressure_mb'],
      precip_mm: json['precip_mm'],
      humidity: (json['humidity'] as int).toDouble(),
      cloud: json['cloud'],
      feels_like: json['feelslike_c'],
      windchill: json['windchill_c'],
      heatindex: json['heatindex_c'],
      willItRain: json['will_it_rain'] == 1 ? true : false,
      willItSnow: json['will_it_show'] == 1 ? true : false ,
      chance_of_rain: json['chance_of_rain'],
      chance_of_snow: json['chance_of_snow'],
      vis_km: json['vis_km'],
      gust_mph: json['gust_mph'],
      uv: json['uv'],
      dewPoint: json['dewpoint_c'],
      airQuality: AirQuality.fromJson(json['air_quality'])
  );

  @override
  WeatherDetails toWeatherDetails (BuildContext context) {
    final format = DateFormat(DateFormat.HOUR , AppLocalizations.of(context)!.lang);
    return WeatherDetails(
      time: format.format(time),
      conditionIcon: conditionIcon,
      conditionText: conditionText,
      willItRain: willItRain,
      willItSnow: willItSnow,
      temp: temp.round().toString(),
    );
  }
}