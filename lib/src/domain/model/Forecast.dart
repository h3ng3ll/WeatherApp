import 'package:weather_app/src/domain/model/Location.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/ForecastDay.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/ForecastNow.dart';

/// Entry point
///
/// Check for details.
/// https://openweathermap.org/api/one-call-3
///
///

class Weather {

  final List<ForecastDay>? forecastDay;
  final ForecastNow now;
  final Location location;

  Weather({

     this.forecastDay,
     required this.location,
      required this.now,
  });

   static Weather fromJson (Map<String , dynamic> json) => Weather(

      forecastDay: List<ForecastDay>.from((json['forecast']['forecastday'] as List<dynamic>)
         .map((e) => ForecastDay.fromJson(e)).toList()),
      now: ForecastNow.fromJson(json['current']),
      location: Location.fromJson(json['location']),

  );

}