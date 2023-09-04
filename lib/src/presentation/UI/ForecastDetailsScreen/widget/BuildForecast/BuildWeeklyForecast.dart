


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/WeatherRepository.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/BuildForecastItems.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/widget/buildSlidingUpPanelBody/widget/BuildWeatherCells.dart';
import 'package:weather_app/src/presentation/provider/WeatherProvider.dart';

class BuildWeeklyForecast extends StatefulWidget {
  const BuildWeeklyForecast({Key? key}) : super(key: key);

  @override
  State<BuildWeeklyForecast> createState() => _BuildWeeklyForecastState();
}

class _BuildWeeklyForecastState extends State<BuildWeeklyForecast> with SingleTickerProviderStateMixin{


  int activeIndex = 0;
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 7, vsync: this );
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
    final weather = Provider.of<WeatherProvider>(context , listen: false);
    final size = MediaQuery.of(context).size;


    return Column(
      children: [
        BuildWeatherCells(
          onTap: onSelectedCell,
          height: size.height*0.2,
          aCellWidth: size.width/6.7,
          activeIndex: activeIndex,
        ),
        IndexedStack(
          index: activeIndex,
          children: weather.weather.forecastDay!.map((day) {
            return BuildForecastItems(
                weeklyForecast: true,
                uv: day.uv,
                sunrise: day.astro.sunrise,
                sunset: day.astro.sunset,
                wind_kph: day.maxwind_kph,
                wind_dir: null,
                precip_mm: day.totalprecip_mm,
                expectedPrecip: WeatherRepository.findExpectedPrecipIn24h(day),
                feelslike_c: null,
                actual_temp: null,
                dew_point: null,
                humidity: day.avghumidity,
                visibility: day.avgvis_km,
                pressure: null,
                currentVisibility:weather.weather.now.vis_km ,
            );
            // return BuildForecastCellItem(
            //   index: index ,
            //   length: details.length,
            //   details: detail,
            //   active: activeIndex == index,
            // );
          }).toList()
        )
      ],
    );

    // return IndexedStack(
    //   index: activeIndex,
    //   children: details.map((detail) {
    //     final index = details.indexOf(detail);
    //     return BuildForecastCellItem(
    //       index: index ,
    //       length: details.length,
    //       details: detail,
    //       active: activeIndex == index,
    //     );
    //   }).toList()
    // );
  }
}
