// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hourly Forecast`
  String get hourly_forecast {
    return Intl.message(
      'Hourly Forecast',
      name: 'hourly_forecast',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Forecast`
  String get weekly_forecast {
    return Intl.message(
      'Weekly Forecast',
      name: 'weekly_forecast',
      desc: '',
      args: [],
    );
  }

  /// `AIR QUALITY`
  String get air_quality {
    return Intl.message(
      'AIR QUALITY',
      name: 'air_quality',
      desc: '',
      args: [],
    );
  }

  /// `Heath Risk`
  String get health_risk {
    return Intl.message(
      'Heath Risk',
      name: 'health_risk',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get good {
    return Intl.message(
      'Good',
      name: 'good',
      desc: '',
      args: [],
    );
  }

  /// `Air quality is considered satisfactory, and air pollution poses little or no risk.`
  String get good_desc {
    return Intl.message(
      'Air quality is considered satisfactory, and air pollution poses little or no risk.',
      name: 'good_desc',
      desc: '',
      args: [],
    );
  }

  /// `Moderate`
  String get moderate {
    return Intl.message(
      'Moderate',
      name: 'moderate',
      desc: '',
      args: [],
    );
  }

  /// `Air quality is acceptable: however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.`
  String get moderate_desc {
    return Intl.message(
      'Air quality is acceptable: however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.',
      name: 'moderate_desc',
      desc: '',
      args: [],
    );
  }

  /// `Unhealthy for sensitive group`
  String get unhealthy_for_sensitive_group {
    return Intl.message(
      'Unhealthy for sensitive group',
      name: 'unhealthy_for_sensitive_group',
      desc: '',
      args: [],
    );
  }

  /// `Members of sensitive groups may experience health effects. The general public is not likely to be affected.`
  String get unhealthy_for_sensitive_group_desc {
    return Intl.message(
      'Members of sensitive groups may experience health effects. The general public is not likely to be affected.',
      name: 'unhealthy_for_sensitive_group_desc',
      desc: '',
      args: [],
    );
  }

  /// `Unhealthy`
  String get unhealthy {
    return Intl.message(
      'Unhealthy',
      name: 'unhealthy',
      desc: '',
      args: [],
    );
  }

  /// `Everyone may begin to experience heath effects; members of sensitive groups may experience more serious health effects.`
  String get unhealthy_desc {
    return Intl.message(
      'Everyone may begin to experience heath effects; members of sensitive groups may experience more serious health effects.',
      name: 'unhealthy_desc',
      desc: '',
      args: [],
    );
  }

  /// `Very unhealthy`
  String get very_unhealthy {
    return Intl.message(
      'Very unhealthy',
      name: 'very_unhealthy',
      desc: '',
      args: [],
    );
  }

  /// `Health alert: everyone may experience more serious health effects .`
  String get very_unhealthy_desc {
    return Intl.message(
      'Health alert: everyone may experience more serious health effects .',
      name: 'very_unhealthy_desc',
      desc: '',
      args: [],
    );
  }

  /// `Hazardous`
  String get hazardous {
    return Intl.message(
      'Hazardous',
      name: 'hazardous',
      desc: '',
      args: [],
    );
  }

  /// `Heath warnings of emergency conditions . The entire population is more likely to be affected.`
  String get hazardous_desc {
    return Intl.message(
      'Heath warnings of emergency conditions . The entire population is more likely to be affected.',
      name: 'hazardous_desc',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get see_more {
    return Intl.message(
      'See more',
      name: 'see_more',
      desc: '',
      args: [],
    );
  }

  /// `index`
  String get index {
    return Intl.message(
      'index',
      name: 'index',
      desc: '',
      args: [],
    );
  }

  /// `sunrise`
  String get sunrise {
    return Intl.message(
      'sunrise',
      name: 'sunrise',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get high {
    return Intl.message(
      'High',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `Very high`
  String get very_high {
    return Intl.message(
      'Very high',
      name: 'very_high',
      desc: '',
      args: [],
    );
  }

  /// `Extreme`
  String get extreme {
    return Intl.message(
      'Extreme',
      name: 'extreme',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get low {
    return Intl.message(
      'Low',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `wind`
  String get wind {
    return Intl.message(
      'wind',
      name: 'wind',
      desc: '',
      args: [],
    );
  }

  /// `rainfall`
  String get rainfall {
    return Intl.message(
      'rainfall',
      name: 'rainfall',
      desc: '',
      args: [],
    );
  }

  /// `feels like`
  String get feels_like {
    return Intl.message(
      'feels like',
      name: 'feels_like',
      desc: '',
      args: [],
    );
  }

  /// `humidity`
  String get humidity {
    return Intl.message(
      'humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `visibility`
  String get visibility {
    return Intl.message(
      'visibility',
      name: 'visibility',
      desc: '',
      args: [],
    );
  }

  /// `pressure`
  String get pressure {
    return Intl.message(
      'pressure',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `in last hour`
  String get in_last_hour {
    return Intl.message(
      'in last hour',
      name: 'in_last_hour',
      desc: '',
      args: [],
    );
  }

  /// `expected in next 24h`
  String get expected_in_next_24h {
    return Intl.message(
      'expected in next 24h',
      name: 'expected_in_next_24h',
      desc: '',
      args: [],
    );
  }

  /// `Similar to the actual temperature`
  String get similar_to_actual_temperature {
    return Intl.message(
      'Similar to the actual temperature',
      name: 'similar_to_actual_temperature',
      desc: '',
      args: [],
    );
  }

  /// `Higher to the actual temperature`
  String get higher_to_actual_temperature {
    return Intl.message(
      'Higher to the actual temperature',
      name: 'higher_to_actual_temperature',
      desc: '',
      args: [],
    );
  }

  /// `Lower to the actual temperature`
  String get lower_to_actual_temperature {
    return Intl.message(
      'Lower to the actual temperature',
      name: 'lower_to_actual_temperature',
      desc: '',
      args: [],
    );
  }

  /// `on`
  String get on {
    return Intl.message(
      'on',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `The dew point is`
  String get the_dew_point_is {
    return Intl.message(
      'The dew point is',
      name: 'the_dew_point_is',
      desc: '',
      args: [],
    );
  }

  /// `right now`
  String get right_now {
    return Intl.message(
      'right now',
      name: 'right_now',
      desc: '',
      args: [],
    );
  }

  /// `similar to the actual temperature`
  String get similar_to_the_actual_temperature {
    return Intl.message(
      'similar to the actual temperature',
      name: 'similar_to_the_actual_temperature',
      desc: '',
      args: [],
    );
  }

  /// `Sunset`
  String get sunset {
    return Intl.message(
      'Sunset',
      name: 'sunset',
      desc: '',
      args: [],
    );
  }

  /// `Weather`
  String get weather {
    return Intl.message(
      'Weather',
      name: 'weather',
      desc: '',
      args: [],
    );
  }

  /// `Search for a city of airport`
  String get search_for_a_city_or_airport {
    return Intl.message(
      'Search for a city of airport',
      name: 'search_for_a_city_or_airport',
      desc: '',
      args: [],
    );
  }

  /// `Current visibility is `
  String get current_visibility_is {
    return Intl.message(
      'Current visibility is ',
      name: 'current_visibility_is',
      desc: '',
      args: [],
    );
  }

  /// `Licences`
  String get licences {
    return Intl.message(
      'Licences',
      name: 'licences',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
