

// ignore_for_file: non_constant_identifier_names

/// Astro  contains sunrise, sunset, moonrise and moonset data
class Astro {
  final String sunrise;
  final String sunset;
  final DateTime? moonrise;
  final String moonset;
  final String? moon_phase;
  final int? moon_illumination;
  final bool is_moon_up;
  final bool is_sun_up;

  Astro({required this.sunrise, required this.sunset, required this.moonrise, required this.moonset, required this.moon_phase, required this.moon_illumination, required this.is_moon_up, required this.is_sun_up});
  
  static Astro fromJson (Map<String , dynamic> json) => Astro(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: DateTime.tryParse(json['moonrise']),
      moonset: json['moonset'],
      moon_phase: json['moon_phase'],
      moon_illumination: json['moon_illumination'],
      is_moon_up: json['is_moon_up'] == 1 ? true : false,
      is_sun_up: json['is_sun_up'] == 1 ? true : false ,
  );
  
}