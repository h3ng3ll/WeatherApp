

class WeatherDetails {
  final String time;
  final Map<String , dynamic> condition;
  final bool willItRain;
  final bool willItSnow ;
  final double temp;
  final bool timeConfirm;

  WeatherDetails({
    required this.time,
    required this.condition,
    required this.willItRain,
    required this.willItSnow,
    required this.temp,
    this.timeConfirm = false,
  });
}