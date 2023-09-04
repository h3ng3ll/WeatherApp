


// ignore_for_file: non_constant_identifier_names

import 'package:weather_app/src/domain/model/WeatherForecast.dart';

abstract class Weather {

  final DateTime? time;
  final int? sunrise;
  final int? sunset;
  // final double temp;
  // final double feels_like;
  final int? pressure;
  final int? humidity;
  final double? dew_point;
  final double? uvi;
  final int? clouds ;
  final int? visibility ;
  final double? wind_speed;
  final int? wind_deg;
  final double? wind_gust;

  final WeatherForecast? weatherForecast;

  Weather({
     this.time,
     this.sunrise,
     this.sunset,
     this.pressure,
     this.humidity,
     this.dew_point,
     this.uvi,
     this.clouds,
     this.visibility,
     this.wind_speed,
     this.wind_deg,
     this.wind_gust,
     this.weatherForecast,
  });

  // static Weather fromJson (Map<String , dynamic> json) => Weather(
  //   dt: json['dt'],
  //   sunrise: json['sunrise'],
  //   sunset: json['sunset'],
  //   temp: json['temp'],
  //   feels_like: json['feels_like'],
  //   pressure: json['pressure'],
  //   humidity: json['humidity'],
  //   dew_point: json['dew_point'],
  //   uvi: json['uvi'],
  //   clouds: json['clouds'],
  //   visibility: json['visibility'],
  //   wind_speed: json['wind_speed'],
  //   wind_deg: json['wind_deg'],
  //   wind_gust: json['wind_gust'],
  //   weatherForecast: WeatherForecast.,
  // );
}