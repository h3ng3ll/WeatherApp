



import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/model/Forecast.dart';
import 'package:weather_app/src/presentation/core/BuildBackGroundWidget.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class UnableLoadWeatherScreen extends StatelessWidget {

  final Function () update;
  final AsyncSnapshot<Weather> snapshot;
  const UnableLoadWeatherScreen({Key? key, required this.snapshot, required this.update}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;

    return BuildBackGroundWidget(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Something went wrong" , style:  bodyLarge,),
              const SizedBox(height: 10,),

              Text(" dates hasn't been loaded" , style:  bodySmall,),
              const SizedBox(height: 15,),

              // Text(snapshot.error.toString() , style:  bodySmall,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text("Please , check your internet connection either  geolocation permission and|or internet one" ,
                  style: bodySmall?.copyWith(color: ColorService.lightPink , fontSize: 18),
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: update,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.5),
                    gradient: const LinearGradient(colors: [
                      ColorService.gradientLightBlue11,
                      ColorService.gradientPink22,
                    ])
                  ),
                  child: Text("Update" , style: bodySmall,)
                ),
              )
            ]
        )
    );
  }

  // List<Widget> catchedErrorRespWidgets (BuildContext context) {
  //
  //   final bodyLarge = Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorService.lightPink);
  //   final bodySmall = Theme.of(context).textTheme.bodySmall;
  //
  //   if((snapshot.error is TimeoutException) &&
  //      (snapshot.error as TimeoutException).message == "Future not completed"
  //   ){
  //     return [
  //       Text("Timeout exception " , style: bodyLarge,),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 40.0),
  //         child: Text("Please , check your internet connection or permissions on geolocation permission and|or internet one" , style: bodySmall,),
  //       )
  //     ];
  //   } else if(
  //   (snapshot.error is Exception) &&
  //   (snapshot.error as ClientException).message == "Failed host lookup: 'api.weatherapi.com'"){
  //
  //   }
  //   return [
  //     // Text(snapshot.error.toString() , style:  bodySmall,),
  //
  //   ];
  // }
}
