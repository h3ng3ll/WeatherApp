// ignore_for_file: non_constant_identifier_names

import 'package:weather_app/src/domain/model/WeatherApi.com/AirQuality.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/WeatherDetails.dart';

class ForecastNow {
  final Map<String , dynamic> condition;
  final double temp;
  final double wind_kph;
  final int wind_degree;
  final String wind_dir;
  final double pressure_mb;
  final double precip_mm;
  final double humidity;
  final int cloud;
  final double feelslike_c;
  final double vis_km;
  final double uv;
  final double gust_mph;
  final AirQuality airQuality;

  ForecastNow({
    required this.condition,
    required this.temp,
    required this.airQuality,
    required this.wind_kph,
    required this.wind_degree,
    required this.wind_dir,
    required this.pressure_mb,
    required this.precip_mm,
    required this.humidity,
    required this.cloud,
    required this.feelslike_c,
    required this.vis_km,
    required this.uv,
    required this.gust_mph
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
      cloud: json['cloud'],
      feelslike_c: json['feelslike_c'],
      vis_km: json['vis_km'],
      uv: json['uv'],
      gust_mph: json['gust_mph'],
      airQuality: AirQuality.fromJson(json['air_quality'])
  );

  WeatherDetails toWeatherDetails () {
    return WeatherDetails(
      time: "Now",
      condition: condition,
      willItRain: false,
      willItSnow: false,
      temp: temp,
      timeConfirm: true
    );
  }
}