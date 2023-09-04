//
//
//
// import 'package:weather_app/src/domain/model/WeatherForecast.dart';
// import 'package:weather_app/src/domain/repository/Weather.dart';
//
// class MyWeather {
//
//
//   final int? last_updated_epoch;
//   final DateTime? last_updated;
//   final double temp_c;
//   final double temp_f;
//   final bool is_day;
//   final Map<String , dynamic>? condition;
//   final double wind_mph  ;
//   final double? wind_kpn  ;
//   final int wind_degree  ;
//   final String wind_dir  ;
//
//
//   MyWeather({
//     required this.last_updated_epoch,
//     required this.last_updated,
//     required this.temp_c,
//     required this.temp_f,
//     required this.is_day,
//     required this.condition,
//     required this.wind_mph,
//     required this.wind_kpn,
//     required this.wind_degree,
//     required this.wind_dir,
//   });
//
//
//   static MyWeather fromJson (Map<String , dynamic> json) => MyWeather(
//     last_updated_epoch: json['last_updated_epoch'],
//     temp_c: json['temp_c'],
//     last_updated: DateTime.tryParse(json['last_updated']),
//     temp_f: json['temp_f'],
//     is_day: json['is_day'] == 1 ? true : false,
//     condition: json['condition'],
//     wind_kpn: json['wind_kpn'],
//     wind_degree: json['wind_degree'],
//     wind_dir: json['wind_dir'],
//     wind_mph: json['wind_mph'],
//
//   );
// }