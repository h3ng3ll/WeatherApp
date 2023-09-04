//
//
//
// import 'package:weather_app/src/domain/model/WeatherForecast.dart';
// import 'package:weather_app/src/domain/repository/Weather.dart';
//
// class HourlyWeatherDeprecated extends Weather{
//
//   final double? temp ;
//   final double? feels_like ;
//   final double? pop;
//
//   HourlyWeatherDeprecated({
//     required super.time,
// 		required super.sunrise,
// 		required super.sunset,
// 		required super.pressure,
// 		required super.humidity,
// 		required super.dew_point,
// 		required super.uvi,
// 		required super.clouds,
// 		required super.visibility,
// 		required super.wind_speed,
// 		required super.wind_deg,
// 		required super.wind_gust,
// 		required super.weatherForecast,
// 		required this.temp,
// 		required this.feels_like,
// 		required this.pop,
//   });
//
//
//   static HourlyWeatherDeprecated fromJson (Map<String , dynamic> json) => HourlyWeatherDeprecated(
//     time: DateTime.fromMillisecondsSinceEpoch(json['dt']),
//     sunrise: json['sunrise'],
//     sunset: json['sunset'],
//     // temp: json['temp'],
//     // feels_like: json['feels_like'],
//     pressure: json['pressure'],
//     humidity: json['humidity'],
//     dew_point: json['dew_point'],
//     uvi: json['uvi'],
//     clouds: json['clouds'],
//     visibility: json['visibility'],
//     wind_speed: json['wind_speed'],
//     wind_deg: json['wind_deg'],
//     wind_gust: json['wind_gust'],
//     pop: json['pop'],
//     feels_like: json['feels_like'],
//     temp: json['temp'],
//     weatherForecast: WeatherForecast.fromJson(json["weather"]),
//   );
// }