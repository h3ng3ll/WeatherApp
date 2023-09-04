


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/BuildForecastSlidingUpPanelExtended.dart';
import 'package:weather_app/src/presentation/core/BuildBackGroundWidget.dart';
import 'package:weather_app/src/presentation/provider/WeatherProvider.dart';

class ForecastDetailsScreen extends StatelessWidget {
  const ForecastDetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final minHeight = size.height*0.8;
    final maxHeight = size.height;



    final titleLarge = Theme.of(context).textTheme.titleLarge;
    final title3 = Theme.of(context).textTheme.titleSmall;

    final provider = Provider.of<WeatherProvider>(context , listen: false);
    // final draggable = Provider.of<ControlDragPanelProvider>(context ).isDraggable;

    return Scaffold(

      body: SlidingUpPanel(
        // panelSnapping: false,
        // border: Border.all(color: ColorService.transparent),
        body: BuildBackGroundWidget(
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.05,
              ),
              Text(provider.weather.location.region , style: titleLarge,),
              Text("${provider.weather.now.temp.toStringAsFixed(0)}° | "
                  "${provider.weather.now.condition['text']}" , style: title3,),
            ],
          ),
        ),
        // isDraggable: draggable,
        minHeight: minHeight,
        maxHeight: maxHeight,
        // padding:EdgeInsets.,
        borderRadius: BorderRadius.circular(25),
        panelBuilder: (controller) => BuildForecastSlidingUpPanelExtended(
          borderRadius:  BorderRadius.circular(25),
        ),
      )
    );
  }
}
