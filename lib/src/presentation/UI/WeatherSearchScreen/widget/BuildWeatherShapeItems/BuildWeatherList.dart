


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/WeatherRepository.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/widget/BuildWeatherShapeItems/BuildWeatherShapeItem.dart';
import 'package:weather_app/src/presentation/provider/SearchWeatherProvider.dart';

class BuildWeatherList extends StatefulWidget {
  final String? request;
  const BuildWeatherList({Key? key, this.request}) : super(key: key);

  @override
  State<BuildWeatherList> createState() => _BuildWeatherListState();
}

class _BuildWeatherListState extends State<BuildWeatherList> {



  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<SearchWeatherProvider>(context );

    if(provider.request != "") {
      final foundedCities = WeatherRepository.fetchForecastByQuery(provider.request);
      return buildForecastList(foundedCities) ;
    } else if (provider.cities == null){

      return FutureBuilder(
          future: provider.initCities(),
          builder: (context , snapshot) {
            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
              final List<Weather> weathers = snapshot.data!;
              return ListView.builder(
                itemCount: weathers.length,
                itemBuilder: (context , index){
                  return BuildWeatherShapeItem(weather: weathers[index],);

                },
              );
            }else {
              return const Center(child: CircularProgressIndicator());
            }

          }
      );
    } else {
      return ListView.builder(
        itemCount: provider.cities!.length,
        itemBuilder: (context , index){
          return BuildWeatherShapeItem(weather: provider.cities![index],);

        },
      );


    }

  }

  Widget buildForecastList(Future<Weather> request) {
    return FutureBuilder<Weather>(
        future: request,
        builder: (context , snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
            final Weather weathers = snapshot.data!;
            return BuildWeatherShapeItem(weather: weathers,);
          }else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }


}
