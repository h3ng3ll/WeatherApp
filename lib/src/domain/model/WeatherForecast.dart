


class WeatherForecast {
  final int id;
  final String main;
  final String description;

  WeatherForecast({required this.id, required this.main, required this.description});


  static fromJson (Map<String , dynamic> json) =>WeatherForecast(
      id: json['id'],
      main: json['main'],
      description: json['description']
  );
}