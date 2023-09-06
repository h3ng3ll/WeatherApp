


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/WeatherRepository.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/widget/buildSlidingUpPanelBody/BuildSlidingUpPanel.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/widget/CustomBotomBar.dart';
import 'package:weather_app/src/presentation/UI/UnalbeLoadWeatherScreen/UnalbeLoadWeatherScreen.dart';
import 'package:weather_app/src/presentation/core/BuildBackGroundWidget.dart';
import 'package:weather_app/src/presentation/core/BuildIcon.dart';
import 'package:weather_app/src/presentation/provider/WeatherProvider.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';
import 'package:weather_app/src/presentation/services/LocationService.dart';

class MainWeatherScreen extends StatefulWidget {
  const MainWeatherScreen({Key? key}) : super(key: key);

  @override
  State<MainWeatherScreen> createState() => _MainWeatherScreenState();
}

class _MainWeatherScreenState extends State<MainWeatherScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: FutureBuilder<Weather>(
        future:  fetchForecast(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final provider = Provider.of<WeatherProvider>(context , listen:  false);
            final forecast = snapshot.data!;
            provider.initWeather(forecast);

            return buildUI(forecast);
          } else if(snapshot.connectionState == ConnectionState.done && snapshot.data == null ){
            return UnableLoadWeatherScreen(snapshot: snapshot, update: () => setState((){}),);
          } else {
            return const BuildBackGroundWidget(child: Center(child: CircularProgressIndicator()) );
          }
        }
      ),
    );
  }

  Widget buildUI (Weather forecast) {
    final size  = MediaQuery.of(context).size;


    return RefreshIndicator(
      onRefresh: () async  {
        setState(() {
        });
        return Future.delayed(const Duration(seconds: 0));
      },
      child: Stack(
        children: [

          /// background asset
          const Positioned.fill(child: BuildIcon(boxFit: BoxFit.cover, iconPath: "icons/bg",)),
          ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children:  [ SizedBox(height: size.height, width: size.width,) ],
          ),
          buildWeatherStatus(forecast),

          /// house asset
          Align(
              alignment: const Alignment(0, 0.7),
              child: BuildIcon(
                width: size.width*7/5,
                iconPath: "icons/house",
                boxFit: BoxFit.fitWidth,
              )
          ),
          const BuildSliderPanel(),

          const CustomBottomBar(),

          // Container(),
        ],
      ),
    );
  }
   Future<Weather> fetchForecast() async {

    final pos = await LocationService.getLocation();

    final forecast = await WeatherRepository.fetchForecastByGeolocation(pos.latitude, pos.longitude);
    return forecast;
  }


  Widget buildWeatherStatus(Weather forecast) {

    final titleLarge = Theme.of(context).textTheme.titleLarge?.copyWith(height: 1);
    final descStyle = TextStyle(color: ColorService.grey , fontSize: 24 , fontWeight: FontWeight.w600 , height: 1);
    return Align(
      alignment:  const Alignment(0 , -0.8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(forecast.location.name , style: titleLarge,),

          Text(
            "${forecast.now.temp.toStringAsFixed(0)}°" ,
            style: titleLarge?.copyWith(fontSize: 94 , fontWeight: FontWeight.w200 , fontStyle: FontStyle.normal),
          ),
          Text(forecast.now.condition['text'], style: descStyle,),
          /// For view highest and lowest temperature must have
          /// enterprise plan
          Text(
            "H:${forecast.forecastDay!.first.maxTemp.toStringAsFixed(0)}°   "
            "L:${forecast.forecastDay!.first.minTemp.toStringAsFixed(0)}°",
            style: titleLarge?.copyWith(fontSize: 24),),

        ],
      ),
    );
  }
  }


