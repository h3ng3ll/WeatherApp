



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';
import 'package:weather_app/src/domain/model/Weather/ForecastCollectionEnum.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/ForecastDay.dart';
import 'package:weather_app/src/domain/privateKey.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherRepository {


  static String _fetchForecastType ({
    required ForecastCollectionEnum state,
    double? lat,
    double? lon,
    String? query,
  }) {
    assert(lat!= null && lon != null || query != null);

    const host = "http://api.weatherapi.com/v1";

    switch(state){
      case ForecastCollectionEnum.byGeolocation:
        return "$host/forecast.json?key=$privateKey&q=$lat,$lon&days=7&aqi=yes";
      case ForecastCollectionEnum.byQuery:
        return "$host/forecast.json?key=$privateKey&q=$query&days=7&aqi=yes";
    }

  }


  static Future<Weather> _fetchWeather (String request) async {
    try {
      var uri = Uri.parse(request);
      final rowJson = await http.get(uri);
      final json = jsonDecode(rowJson.body);
      final forecast = Weather.fromJson(json );
      return forecast;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  static Future<Weather>  fetchForecastByQuery(String  query) async {
    final request = _fetchForecastType(
        state: ForecastCollectionEnum.byQuery ,
        query: query
    );

    final weather = await _fetchWeather(request);
    return weather;
  }
  
  static Future<Weather> fetchForecastByGeolocation (double lat , double lon ) async {

    // lat = double.parse(49.965321.toStringAsFixed(2));
    // lon = double.parse(33.609760.toStringAsFixed(2));
    lat = double.parse(lat.toStringAsFixed(2));
    lon = double.parse(lon.toStringAsFixed(2));

    final request = _fetchForecastType(
        state: ForecastCollectionEnum.byGeolocation ,
        lat: lat ,
        lon: lon
    );
    return await _fetchWeather(request);

  }



  /// The  UI design has not enough assets to implement
  /// that function .
  // String? convertWeatherForecastToIcon (Map<String , dynamic> condition) {
  //
  //   switch (condition['text']) {
  //     /// sunny
  //     case "Sunny": BuildIc
  //   }
  // }

  /// UltraViolet Index
  /// return text of level risk.
  static String? translateUIIndex (int indexUV, BuildContext context) {
    switch(indexUV){
      case 1 || 2     :   return AppLocalizations.of(context)!.low;
      case 3 || 4 || 5:   return AppLocalizations.of(context)!.moderate;
      case 6 || 7:        return AppLocalizations.of(context)!.high;
      case 8 || 9 || 10 : return AppLocalizations.of(context)!.very_high;
      case >= 11:         return AppLocalizations.of(context)!.extreme;
    }
    return null;
  }


  static double findExpectedPrecipIn24h (ForecastDay forecastDay) {
    final maxPrecip = forecastDay.hours.map((e) => e.precip_mm)
        .reduce((value, element) => value > element ? element : value);
    return maxPrecip;
  }

  ///  take hours ago and hours in future and return arrangement value .
  static double  getCurrentDewPoint (Weather weather) {
    final hour = DateTime.now().hour;

    final hours = List.generate(24, (index) => index);

    for(int i  = 0 ; i<hours.length ; i++){
      if(hours[i] == hour ){
        if(hours[i] == hours.length-1 ){
          final dewPoint1 = weather.forecastDay!.first.hours[i-1].dewPoint;
          final dewPoint2 = weather.forecastDay!.first.hours[i].dewPoint;
          return (dewPoint2+dewPoint1)/2;
        } else {
          final dewPoint1 = weather.forecastDay!.first.hours[i].dewPoint;
          final dewPoint2 = weather.forecastDay!.first.hours[i+1].dewPoint;
          return (dewPoint2+dewPoint1)/2;
        }

      }
    }

    throw Exception("Error calculated arrangement of Dew Point");
  }
}