//
//
//
// import 'package:weather_app/src/domain/model/WeatherForecast.dart';
// import 'package:weather_app/src/domain/repository/Weather.dart';
//
// class HourlyWeather extends Weather{
//
//   final int? moonrise;
//   final int? moonset;
//   final double? moon_phase;
//   final String? summary;
//   final double? temp;
//   final double? feels_like;
//   final double? temp_min;
//   final double? temp_max;
//   final String? weatherName;
//   final String? weatherNameDescription;
//   final int? pop ;
//   /// day or night
//   final String? pod;
//
//   HourlyWeather({
//      super.time,
//      super.sunrise,
//      super.sunset,
//      super.pressure,
//      super.humidity,
// 		 super.dew_point,
// 		 super.uvi,
// 		 super.clouds,
// 		 super.visibility,
// 		 super.wind_speed,
// 		 super.wind_deg,
// 		 super.wind_gust,
// 		 super.weatherForecast,
//      this.temp,
//      this.feels_like,
//      this.moonrise,
//      this.moon_phase,
//      this.moonset,
//      this.summary,
//      this.temp_min,
//      this.temp_max,
//      this.weatherName,
//      this.weatherNameDescription,
//      this.pop,
//      this.pod,
//   }) : super() ;
//
//   static HourlyWeather fromJson (Map<String , dynamic> json) {
//
//     final main = json['main'];
//     final weather = json['weather'][0];
//     final wind = json['wind'];
//
//     return HourlyWeather(
//
//       time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
//
//       temp: main['temp'],
//       feels_like: main['feels_like'],
//       temp_min: main['temp_min'],
//       temp_max: main['temp_max'],
//       pressure: main['pressure'],
//       humidity: main['humidity'],
//
//       weatherName: weather['main'],
//       weatherNameDescription: weather['description'],
//
//       clouds: json['clouds']['all'],
//
//       wind_speed: wind['speed'],
//       wind_deg: wind['deg'],
//       wind_gust: wind['gust'],
//
//       sunrise: json['sunrise'],
//       sunset: json['sunset'],
//
//       visibility: json['visibility'],
//
//       pop: json['pop'],
//
//       pod: json['pod'],
//
//
//
//       // dew_point: json['dew_point'],
//       // uvi: json['uvi'],
//       //
//       // weatherForecast: WeatherForecast.fromJson(json["weather"]),
//       // moonrise: json['moonrise'],
//       // moonset: json['moonset'],
//       // moon_phase: json['moon_phase'],
//       // summary: json['summary'],
//     );
//   }
//
// }