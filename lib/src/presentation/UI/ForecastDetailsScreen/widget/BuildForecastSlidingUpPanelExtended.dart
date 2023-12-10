



import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/BuildForecast/BuildHourlyForecast.dart';
import 'package:weather_app/src/presentation/UI/ForecastDetailsScreen/widget/BuildForecast/BuildWeeklyForecast.dart';
import 'package:weather_app/src/presentation/core/DefaultTabBar.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildForecastSlidingUpPanelExtended extends StatefulWidget {
  final BorderRadius borderRadius;
  const BuildForecastSlidingUpPanelExtended({Key? key, required this.borderRadius}) : super(key: key);

  @override
  State<BuildForecastSlidingUpPanelExtended> createState() => _BuildForecastSlidingUpPanelExtendedState();
}

class _BuildForecastSlidingUpPanelExtendedState extends State<BuildForecastSlidingUpPanelExtended> with SingleTickerProviderStateMixin{

  late final TabController  controller   ;
  final ScrollController scrollController = ScrollController();
  int selectedIndex = 0 ;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


    @override
  Widget build(BuildContext context) {

    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18);

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: DefaultTabController(
        length: 2,
        child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorService.gradientDarkBlue1 ,
                  ColorService.gradientDarkBlue2
                ],

            ),
                borderRadius: widget.borderRadius
            ),
            child: ListView(
              controller: scrollController,
              children: [



                DefaultTabBar(
                  controller: controller,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                      controller.animateTo(index);
                    });
                  },
                  padding: const EdgeInsets.only(top:20.0),
                  tabs: [
                    Text(AppLocalizations.of(context)!.hourly_forecast , style: titleSmall,),
                    Text(AppLocalizations.of(context)!.weekly_forecast  , style: titleSmall,),
                  ],
                ),
                IndexedStack(
                  index: selectedIndex,
                  children: const [
                    BuildHourlyForecast(),
                    BuildWeeklyForecast(),
                  ],
                )
              ],
            )
        ),
      ),
    );


  }



}
