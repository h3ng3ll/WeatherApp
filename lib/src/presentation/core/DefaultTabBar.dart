

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class DefaultTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final Function (int index) onTap ;
  final TabController controller ;
  final EdgeInsets padding;


  const DefaultTabBar({
    Key? key,
    required this.tabs,
    required this.onTap,
    required this.controller,
    this.padding = const EdgeInsets.only(top:20.0)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Stack(
      children: [

        ...buildShaders(context),

        Padding(
          padding: padding,
          child: TabBar(
            dividerColor: ColorService.transparent,
            indicator: const BoxDecoration(),
            controller: controller,
            onTap: onTap,
            tabs: tabs,
            // padding: const EdgeInsets.only(top: 20 , bottom: 10),
          ),
        ),
      ],
    );
  }

  List<Widget> buildShaders (BuildContext context) {
    final size = MediaQuery.of(context).size;
    return        [
      Positioned(
        top: 0,
        right: 20,
        left: 20,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(

                  stops: [0.0 , 0.3 ,  0.7 , 1],
                  colors: [
                    ColorService.transparent,
                    ColorService.pinkShade,
                    ColorService.pinkShade,
                    ColorService.transparent,
                  ]
              )
          ),
          height: 1,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 40,
                    color: ColorService.purpleShade
                )
              ]
          ),
          height: 10,
          width: size.width/1.5,
        ),
      ),

      /// divider
      Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: ColorService.purpleShade2,
              height: 1,
              width: size.width,
            ),
            Container(
              color: ColorService.purpleShade3,
              height: 2,
              width: size.width,
            )
          ],
        ),
      ),
      /// tab
      Positioned(
          right: controller.index == 1 ? 0 : null,
          left: controller.index == 0 ? 0 : null,
          bottom: 3,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: const [0.0 , 0.4 ,  0.6 , 1],
                    colors: [
                      ColorService.transparent,
                      ColorService.white.withOpacity(0.5),
                      ColorService.white.withOpacity(0.5),
                      ColorService.transparent,
                    ]
                )
            ),
            height: 2,
            width: size.width/2,
          )
      ),
    ];
  }
}
