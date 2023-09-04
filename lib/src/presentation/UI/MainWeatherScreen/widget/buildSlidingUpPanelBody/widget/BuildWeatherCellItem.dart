


import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/WeatherDetails.dart';
import 'package:weather_app/src/presentation/core/BuildIcon.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class BuildForecastCellItem extends StatelessWidget {
  final int index;
  final int length;
  final bool active ;
  final WeatherDetails details;

  const BuildForecastCellItem({Key? key, required this.index, required this.length , this.active = false, required this.details}) : super(key: key);

  /// It Have different painted UI from default  inactive Cell
  factory BuildForecastCellItem.active ({
    Key? key,
    required int index,
    required int length,
    required WeatherDetails details,

  }) => BuildForecastCellItem(index: index, length: length , active: true, details: details,);


  final double longPadding = 20;
  final double lowPadding = 8;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    // final descStyle = TextStyle(color: ColorService.grey , fontSize: 24 , fontWeight: FontWeight.w600);


    return Padding(
      padding: EdgeInsets.only(
          bottom: 10,
          top: 10,
          left: index == 0 ? longPadding : lowPadding,
          right: index == length-1 ? longPadding : lowPadding
      ),
      child: Container(
        width: size.width/6.7,
        padding: const EdgeInsets.all(4),
        decoration:  BoxDecoration(
          border: Border.all(
              color: active ?
                      ColorService.purple3 :
                      ColorService.darkBlue2 ,
              width: 2
          ),
          color: active ? ColorService.purple2 : ColorService.darkBlue,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: const [
            BoxShadow(
              color: ColorService.black,
              blurRadius: 10,
              spreadRadius: -2,
              offset: Offset(2, 2)
            )
          ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text(details.time , style: titleLarge?.copyWith(fontSize: 18)),

            BuildIcon.network(iconPath: "https:${details.condition['icon']}"),

            Text("${details.temp.round()}°" , style: titleLarge?.copyWith(fontSize: 20)),

          ],
        ),
      ),
    );
  }
}
