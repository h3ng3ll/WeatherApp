


import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/widget/buildSlidingUpPanelBody/widget/BuildMovementLine.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/widget/buildSlidingUpPanelBody/widget/BuildWeatherCells.dart';
import 'package:weather_app/src/presentation/core/DefaultTabBar.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildSlidingUpPanelBody extends StatefulWidget {

  final BorderRadius borderRadius;
  const BuildSlidingUpPanelBody({Key? key, required this.borderRadius}) : super(key: key);

  @override
  State<BuildSlidingUpPanelBody> createState() => _BuildSlidingUpPanelBodyState();
}

class _BuildSlidingUpPanelBodyState extends State<BuildSlidingUpPanelBody> with SingleTickerProviderStateMixin {

  late final TabController controller;
  int activeIndex = 0 ;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final subHeadline = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);

    return SizedBox(
      height: size.height*2/5,
      width: size.width,
      child: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            ColorService.darkBlue3,
                            ColorService.darkBlue4,
                          ]
                      ),
                      borderRadius: widget.borderRadius
                  ),
                  child: Column(
                    children: [
                      DefaultTabBar(
                          padding: const EdgeInsets.only(top: 20 ),
                          tabs: [
                            Text(AppLocalizations.of(context)!.hourly_forecast , style: subHeadline,),
                            Text(AppLocalizations.of(context)!.weekly_forecast  , style: subHeadline,),
                          ],
                          onTap: (index) {
                            setState(() {
                              activeIndex = index;
                              controller.animateTo(index);
                            });
                          },
                          controller: controller
                      ),

                       Expanded(
                        child: IndexedStack(
                            index: activeIndex,
                            children: [
                              BuildWeatherCells.horly(
                                aCellWidth: size.width/6.7,
                              ),
                               BuildWeatherCells(
                                 aCellWidth: size.width/6.7,
                               ),
                            ].map((e) => Column(
                              children: [
                                const Spacer(
                                  flex: 1,
                                ),
                                Expanded(
                                    flex: 20,
                                    child: e
                                ),
                                const Spacer(
                                  flex: 12,
                                )
                              ],
                            )).toList()
                        ),
                      )
                    ],
                  )
              ),
            ),

            const BuildMovementLine(),
            // CustomBottomBar(),
          ],
        ),
      ),
    );
  }
}
