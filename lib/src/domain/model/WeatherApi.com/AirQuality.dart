
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AirQuality {
  final double? co;
  final double? no2;
  final double? so2;
  final double? pm2_5;
  final double? pm10;
  final int? us_epa_index;
  final int? gb_defra_index;

  AirQuality({required this.co, required this.no2, required this.so2, required this.pm2_5, required this.pm10, required this.us_epa_index, required this.gb_defra_index});

  static AirQuality fromJson (Map<String , dynamic>? json ) => AirQuality(
      co: json?['co'],
      no2: json?['no2'],
      so2: json?['so2'],
      pm2_5: json?['pm2_5'],
      pm10: json?['pm10'],
      us_epa_index: json?['us-epa-index'],
      gb_defra_index: json?['gb-defra-index'],
  );

  String getHealthRisk(BuildContext context) {
    late String status;
    switch(us_epa_index) {
      case 1: status = AppLocalizations.of(context)!.good;
      case 2: status = AppLocalizations.of(context)!.moderate;
      case 3: status =  AppLocalizations.of(context)!.unhealthy_for_sensitive_group;
      case 4: status =  AppLocalizations.of(context)!.unhealthy;
      case 5: status =  AppLocalizations.of(context)!.very_unhealthy;
      case 6: status =  AppLocalizations.of(context)!.hazardous;
    }
    return "$us_epa_index-$status";
  }
}