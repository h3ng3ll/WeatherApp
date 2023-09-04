


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/routes/AppRoutes.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/ForecastDetailsScreen.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/clippers/CenterTabBarClipper.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/clippers/TabBarShapeClipper.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/paints/CenterTabBarPaint.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/paints/TabBarShapePaint.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/BuildWeatherSearchScreen.dart';
import 'package:weather_app/src/presentation/core/BuildIcon.dart';
import 'package:weather_app/src/presentation/provider/ControllDragPanelProvider.dart';
import 'package:weather_app/src/presentation/provider/SearchWeatherProvider.dart';
import 'package:weather_app/src/presentation/provider/UpPanelProvider.dart';
import 'package:weather_app/src/presentation/provider/WeatherProvider.dart';

import 'package:weather_app/src/presentation/services/ColorService.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final barHeight = size.height/9;

    /// Global position at the screen
    return Align(
      alignment: Alignment.bottomCenter,
      /// Relative by Bottom Tab Bar
      child: Stack(
        children: [

          /// build form and paint it .
          ...buildClipperWithPainter(barHeight , size),

          buildAddButton(Size(size.width/2.5, barHeight) , context),

          buildKeyButton(size , context),
          buildMenuButton(size , context),



        ],
      ),
    );
  }

List<Widget> buildClipperWithPainter (double barHeight , Size size) => [
  /// Clipper
  Align(
    alignment: Alignment.bottomCenter,
    child: ClipPath(
      clipper: TabBarShapeClipper(),
      child: Container(
        color: ColorService.darkBlue,
        height: barHeight,
        width: size.width,
        child: Row(
          children: [
            Expanded(child: Container()),

            /// the plug for centered , stacked
            /// button .
            const Spacer(),
            Expanded(child: Container()),
          ],
        ),
      ),
    ),
  ),
  /// Painter
  Align(
    alignment: Alignment.bottomCenter,
    child: CustomPaint(
      painter: TabBarShapePaint(),
      child: SizedBox(
        height: barHeight,
        width: size.width,
      ),
    ),
  ),
];

  Widget buildAddButton (Size size , BuildContext context) {

    void onTap () async {
      final provider = Provider.of<UpPanelProvider>(context , listen: false);
      provider.openedPanel ?  await provider.closePanel() : await provider.openPanel();
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            /// Shape
            ClipPath(
              clipper: CenterTabBarClipper(size: size,),
              child: Container(

                // height: size.height/8,
                color: ColorService.darkBlue3,
              ),
            ),
            /// Color
            CustomPaint(
              painter: CenterTabBarPaint(
                size: size,
              ),
              child: Container(
                // height: size.height/8,
              ),
            ),
            /// Button
            InkWell(
              onTap: onTap,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorService.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1 , 1),
                          spreadRadius: 2,
                          blurRadius: 1,
                        color: ColorService.white.withOpacity(0.4)
                      ),
                      BoxShadow(
                          offset: const Offset(-2 , -3),
                          // spreadRadius: 0,
                          blurRadius: 2,
                          blurStyle: BlurStyle.inner,
                          color: ColorService.black.withOpacity(0.8)
                      ),
                      BoxShadow(
                          offset: const Offset(-9 , -9),
                          spreadRadius: 1,
                          blurRadius: 15,

                          color: ColorService.white.withOpacity(0.4)
                      )
                    ]
                  ),
                  height: size.height/2,
                  width: size.height/2,
                  child: const BuildIcon(
                    iconPath: 'icons/general/plus',
                    boxFit: BoxFit.fitWidth,
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildKeyButton(Size size , BuildContext context) {
    return Align(
        alignment: const Alignment(-0.8, 0.975),
        child: InkWell(
          onTap: () {
            final provider = Provider.of<SearchWeatherProvider>(context , listen: false);
            Navigator.push(context, AppRoutes.createAnimatedRoute(
              page: ChangeNotifierProvider.value(
                  value: provider,
                  child: const WeatherSearchScreen()
              ),
              dir: AnimationDirection.right,
            )
            );
          },
          child: BuildIcon(
              iconPath: "icons/general/keyWhite",
              boxFit: BoxFit.fill,
              size: size.height*0.068,
          ),
        )
    );
  }


  Widget buildMenuButton(Size size , BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context , listen:  false) ;
    return Align(
        alignment: const Alignment(0.7, 0.94),
        child: InkWell(
          onTap: () {
            Navigator.push(context, AppRoutes.createAnimatedRoute(
                dir: AnimationDirection.left,
                page: Provider.value(value: provider,
                child: const ForecastDetailsScreen()
                )
            ));
          },
          child: BuildIcon(
              iconPath: "icons/general/menuWhite",
              boxFit: BoxFit.fill,
              size: size.height*0.03,
          ),
        ),

    );
  }



}
