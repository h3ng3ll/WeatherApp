


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/WeatherRepository.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/widget/BuildWeatherShapeItems/BuildWeatherShapeItem.dart';
import 'package:weather_app/src/presentation/provider/SearchWeatherProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildWeatherList extends StatefulWidget {
  final String? request;
  const BuildWeatherList({Key? key, this.request}) : super(key: key);

  @override
  State<BuildWeatherList> createState() => _BuildWeatherListState();
}

class _BuildWeatherListState extends State<BuildWeatherList> {



  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    final provider = Provider.of<SearchWeatherProvider>(context );
    if(provider.request != "" && provider.request.length >= 3) {
      return FutureBuilder<Forecast>(
          future: WeatherRepository.fetchForecastByQuery(provider.request , context),
          builder: (context , snapshot){
            if (snapshot.connectionState == ConnectionState.done) {
              final weathers = snapshot.data;
              if(weathers == null){
                return Center(child: Text(
                    AppLocalizations.of(context)!.failed_to_fetch_weather , style: bodyLarge,
                ),
                );
              }
                return BuildWeatherShapeItem(weather: weathers,);
                // return buildForecastList(foundedCities
            }
            else {
              return const Center(child: CircularProgressIndicator());
            }
          }
      );
    } else if (provider.cities == null){
      return FutureBuilder(
          future: provider.initCities(context),
          builder: (context , snapshot) {
            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
              final List<Forecast> weathers = snapshot.data!;
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

  Widget buildForecastList(Future<Forecast> request) {
    return FutureBuilder<Forecast>(
        future: request,
        builder: (context , snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
            final Forecast weathers = snapshot.data!;
            return BuildWeatherShapeItem(weather: weathers,);
          }else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }


}
