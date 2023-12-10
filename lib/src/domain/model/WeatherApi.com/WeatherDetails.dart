

class WeatherDetails {
  final String time;
  final String conditionIcon;
  final String conditionText;

  final bool willItRain;
  final bool willItSnow ;
  final String temp;
  final bool timeConfirm;

  WeatherDetails({
    required this.time,
    required this.conditionIcon,
    required this.conditionText,
    required this.willItRain,
    required this.willItSnow,
    required this.temp,
    this.timeConfirm = false,
  });
}