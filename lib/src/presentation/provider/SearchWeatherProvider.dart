

import 'package:flutter/material.dart';
import 'package:weather_app/src/data/WeatherRepository.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';

class SearchWeatherProvider extends ChangeNotifier {



   List<Weather>? cities ;

  SearchWeatherProvider () {
    /// default weather when request is empty
    initCities().then((value) => cities = value);

  }

  Future<List<Weather>> initCities () async  {
    final List cityQuery = ["Kiev", "Montreal", "Toronto", "Tokyo",];
    return Stream.fromIterable(cityQuery).asyncMap((query) async =>
     await WeatherRepository.fetchForecastByQuery(query))
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