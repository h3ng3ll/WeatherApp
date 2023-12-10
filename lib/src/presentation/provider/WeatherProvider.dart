

import 'package:weather_app/src/domain/model/Forecast.dart';

class WeatherProvider {

  late Forecast weather;

  void initWeather (Forecast weather) => this.weather = weather;

}