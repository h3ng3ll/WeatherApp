

// ignore_for_file: non_constant_identifier_names

class Location {
  final String name;
  final String region;
  final String country;

  final double lat;
  final double lon;
  final String tc_id;

  final DateTime localTime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tc_id,
    required this.localTime
  });

  Location fromJson (Map<String , dynamic> json) => Location(
      name: json['name'],
      region: json['name'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lat'],
      tc_id: json['tc_id'],
      localTime: DateTime.fromMillisecondsSinceEpoch(json['localTime'] * 1000)
  );
}