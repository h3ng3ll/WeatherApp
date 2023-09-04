
// ignore_for_file: non_constant_identifier_names

class Location {
  final double lat;
  final double lon;
  final String name;
  final String region;
  final String country;
  final String tz_id;
  final int localtime_epoch;
  final DateTime? localTime;

  Location({
    required this.lat,
    required this.lon,
    required this.name,
    required this.region,
    required this.country,
    required this.tz_id,
    required this.localtime_epoch,
    required this.localTime,
  });

  static fromJson (Map<String , dynamic> json) => Location(

      lat: json['lat'],
      lon: json['lon'],
      name: json['name'],
      region: json['region'],
      country: json['country'],
      localtime_epoch: json['localtime_epoch'],
      localTime: DateTime.tryParse(json['localtime'] ),
      tz_id: json['tz_id'],

  );
}