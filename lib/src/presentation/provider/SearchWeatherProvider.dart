

import 'package:flutter/material.dart';
import 'package:weather_app/src/data/WeatherRepository.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';

class SearchWeatherProvider extends ChangeNotifier {



   List<Forecast>? cities ;

  SearchWeatherProvider (BuildContext context) {
    /// default weather when request is empty
    initCities( context).then((value) => cities = value);

  }

  Future<List<Forecast>> initCities (BuildContext context) async  {
    final List cityQuery = ["Kyiv", "Montreal", "Toronto", "Tokyo",];
    return Stream.fromIterable(cityQuery).asyncMap((query) async =>
     await WeatherRepository.fetchForecastByQuery(query , context))
        .toList().then((value) => cities = value);
  }
  String _request = "";

  String get request => _request;
   set request (String value) {

    _request = value;
    notifyListeners();
  }

  void resetRequest () => _request = "";


}