



import 'package:weather_app/src/domain/model/WeatherApi.com/AirQuality.dart';

/// the fields which are  exists whenever now or
/// next Future .
 class WeatherGeneral {

  /// Ultra Violet
  final double  uv ;
  final AirQuality? airQuality;

  final DateTime time;
  final Map<String, dynamic> _condition;

  WeatherGeneral( {
    required this.uv ,
    required this.airQuality,
    required Map<String , dynamic> condition,
    required this.time
  }) : _condition = condition;

  String  get conditionText => _condition['text'];
  String  get conditionIcon => _condition['icon'];
}