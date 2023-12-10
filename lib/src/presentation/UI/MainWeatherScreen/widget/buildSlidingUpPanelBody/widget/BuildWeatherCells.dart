


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/domain/model/WeatherApi.com/WeatherDetails.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/widget/buildSlidingUpPanelBody/widget/BuildWeatherCellItem.dart';
import 'package:weather_app/src/presentation/provider/WeatherProvider.dart';

class BuildWeatherCells extends StatefulWidget {

  final bool horlyBuild;
  final bool weeklyBuild;
  final double? height;
  final double aCellWidth ;
  final Function(int)? onTap;
  final int? activeIndex;

   const BuildWeatherCells({
    Key? key,
    this.horlyBuild =  false,
    this.weeklyBuild = true,
    this.height,
    required this.aCellWidth,
    this.onTap,
    this.activeIndex,
  }) : super(key: key);

  factory BuildWeatherCells.horly({ 
    double? height ,
    required double aCellWidth,
    Function(int)? onTap ,
    int? activeCell
  }) => BuildWeatherCells(
    horlyBuild: true,
    weeklyBuild:  false,
    height: height,
    aCellWidth: aCellWidth,
    onTap: onTap,
    activeIndex: activeCell,
  );

  @override
  State<BuildWeatherCells> createState() => _BuildWeatherCellsState();
}

class _BuildWeatherCellsState extends State<BuildWeatherCells> {
  late final List<WeatherDetails> details ;

  late final ScrollController controller;
  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final weather = Provider.of<WeatherProvider>(context , listen:  false).weather;

    if(widget.horlyBuild) {
      final hours = weather.forecastDay!.first.hours;
      details = hours.map((e) => e.toWeatherDetails(context)).toList();

      final nowHour = DateTime.now().hour;
      // final time = hours.map((e) => e).firstWhere((element) => nowHour < element.hourTime.hour && nowHour == (element.hourTime.hour-1));

      final index = nowHour == 24 ? 1 : nowHour; //hours.indexOf(time);

      details.insert(index  , weather.now.toWeatherDetails(context));



      controller = ScrollController(initialScrollOffset: index * widget.aCellWidth*1.1);
    }
    else {
      details =  weather.forecastDay!.map((e) => e.toWeatherDetails(context)).toList();
      controller = ScrollController();
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: widget.height ?? MediaQuery.of(context).size.height*0.025,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: details.length,
          controller: controller,
          itemBuilder: (context , index) {
            return InkWell(
              onTap: ( ) =>  widget.onTap != null ?  widget.onTap!(index) : null ,
              child: BuildForecastCellItem(
                index: index,
                length: details.length,
                details: details[index],
                active: widget.activeIndex == index ? true :
                        details[index].timeConfirm && widget.activeIndex == null ? true :  false ,
              ),
            );
          }
      ),
    );
  }
}
