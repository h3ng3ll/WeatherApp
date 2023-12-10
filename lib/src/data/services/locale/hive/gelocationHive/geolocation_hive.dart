



import 'package:hive/hive.dart';

part 'geolocation_hive.g.dart';

@HiveType(typeId: 1)
class GeolocationHive {

  /// Latitude
  @HiveField(0)
  final  double lat ;

  /// Longitude
  @HiveField(1)
  final double lon;

  @HiveField(2)
  final String? townName;

  GeolocationHive({required this.lat, required this.lon , required this.townName});
}