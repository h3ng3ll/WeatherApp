


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/WeatherRepository.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/BuildForecastItems.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/widget/buildSlidingUpPanelBody/widget/BuildWeatherCells.dart';
import 'package:weather_app/src/presentation/provider/WeatherProvider.dart';

class BuildHourlyForecast extends StatefulWidget {
  const BuildHourlyForecast({Key? key}) : super(key: key);

  @override
  State<BuildHourlyForecast> createState() => _BuildHourlyForecastState();
}

class _BuildHourlyForecastState extends State<BuildHourlyForecast> with SingleTickerProviderStateMixin {

  int activeIndex = 0;
  late final TabController controller;

  late final int initialIndex;
  @override
  void initState() {
    super.initState();

    /// define position depend on current hour of day.
    final nowHour = DateTime.now().hour;

    activeIndex = nowHour == 0 ? 1 : nowHour;
    initialIndex = activeIndex;
    controller = TabController(length: 25, vsync: this , initialIndex: initialIndex);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSelectedCell (int index) {
    setState(() {
      activeIndex = index;
      controller.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    

    return Column(
      children: [
        BuildWeatherCells.horly(
          height: size.height*0.25,
          aCellWidth: size.width/6.7,
          onTap: onSelectedCell,
          activeCell: activeIndex,
        ),

        IndexedStack(
            index: activeIndex,
            children: items(context)
        ),
      ],
    );
  }
  
  List<Widget> items (BuildContext context) {


    final weather = Provider.of<WeatherProvider>(context , listen: false).weather;
    final forecastDay = weather.forecastDay;
    final now = weather.now;

    final nowBuild = BuildForecastItems(
        hourlyForecast: true,
        now: true,
        uv: now.uv,
        sunrise: forecastDay!.first.astro.sunrise,
        sunset: forecastDay.first.astro.sunset,
        wind_kph: now.wind_kph,
        wind_dir: now.wind_dir,
        precip_mm: now.precip_mm,
        expectedPrecip: WeatherRepository.findExpectedPrecipIn24h(forecastDay.first),
        feelslike_c: now.feelslike_c,
        actual_temp: now.temp,
        dew_point: WeatherRepository.getCurrentDewPoint(weather),
        humidity: now.humidity,
        visibility: now.vis_km,
        pressure: now.pressure_mb,
        currentVisibility: now.vis_km,
    );
    final items = forecastDay.first.hours.map((hour) {
      return BuildForecastItems(
          weeklyForecast: true,
          uv: hour.uv,
          sunrise: forecastDay.first.astro.sunrise,
          sunset: forecastDay.first.astro.sunset,
          wind_kph: hour.wind_kph,
          wind_dir: hour.wind_dir,
          precip_mm: hour.precip_mm,
          expectedPrecip: WeatherRepository.findExpectedPrecipIn24h(forecastDay.first),
          feelslike_c: hour.feels_like,
          actual_temp: hour.temp,
          dew_point: hour.dewPoint,
          humidity: hour.humidity,
          visibility: hour.vis_km,
          pressure: hour.pressure_mb,
          currentVisibility: now.vis_km,
      );
    }).toList()..insert(initialIndex, nowBuild);



    
    return items;
  }
}
