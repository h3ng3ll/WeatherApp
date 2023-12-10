
// ignore_for_file: non_constant_identifier_names

class Location {
  final double lat;
  final double lon;
  final String name;
  final String region;
  final String country;
  final DateTime localtime_epoch;
  // final DateTime? localTime;

  Location({
    required this. lat,
    required this.lon,
    required this.name,
    required this.region,
    required this.country,
    required this.localtime_epoch,
    // required this.localTime,
  }) ;

  static fromJson (Map<String , dynamic> json) => Location(

      lat: json['lat'],
      lon: json['lon'],
      name: json['name'],
      region: json['region'],
      country: json['country'],
      localtime_epoch: DateTime.fromMillisecondsSinceEpoch(json['localtime_epoch'] * 1000),
      // localTime: DateTime.tryParse(json['localtime'] ),
  );




}