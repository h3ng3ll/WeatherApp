


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/widget/buildSlidingUpPanelBody/BuildSlidingUpPanelBody.dart';
import 'package:weather_app/src/presentation/provider/UpPanelProvider.dart';

class BuildSliderPanel extends StatelessWidget {
   const BuildSliderPanel({Key? key}) : super(key: key);


  final double _panelHeightClosed = 0.0;

   final borderRadius = const BorderRadius.vertical(top: Radius.circular(25));

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UpPanelProvider>(context );
    double panelHeightOpen = MediaQuery.of(context).size.height*0.4;

    return SlidingUpPanel(
      maxHeight: panelHeightOpen,
      minHeight: _panelHeightClosed,
      borderRadius: borderRadius,
      panelBuilder: (_) =>  BuildSlidingUpPanelBody(borderRadius: borderRadius),//_panel(sc , context),
      controller:  provider.panelController
      // body: ,
    );
  }

}
