


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/src/data/services/locale/hive/gelocationHive/geolocation_hive.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/dialogs/DecorationDialog.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/widget/BuildWeatherSearchBar/BuildWeatherSearchBar.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/widget/BuildWeatherShapeItems/BuildWeatherList.dart';
import 'package:weather_app/src/presentation/core/BuildIcon.dart';
import 'package:weather_app/src/presentation/core/BuildBackGroundWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather_app/src/presentation/provider/SearchWeatherProvider.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class WeatherSearchScreen extends StatelessWidget {
  const WeatherSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: BuildBackGroundWidget(
            padding: const EdgeInsets.only(left: 15 , right: 15 , top: 15),
            child: Column(
              children: [
                const Spacer(flex: 1,),
                buildTitle(context),
                const Spacer(flex: 1,),
                const BuildWeatherSearchBar(),
                const SizedBox(height: 5,),
                const Expanded(
                    flex: 20,
                    child: BuildWeatherList(request: null,)
                )


              ],
            )
        )
    );
  }

  Widget buildTitle (BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Provider.of<SearchWeatherProvider>(context , listen: false).resetRequest();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios , color: ColorService.greySecondary, size: 30,)
        ),

        Text(AppLocalizations.of(context)!.weather , style: bodyLarge,),
        const Spacer(),

        InkWell(
          onTap: () async {
            await showResetDialog(context);
          },
          child: Icon(Icons.settings_backup_restore_sharp , color: ColorService.white, size: 40,),
          // child: const BuildIcon(
          //   iconPath: "icons/general/threeDots" ,
          //   boxFit: BoxFit.cover,
          //   size: 35,
          // ),
        ),
        const SizedBox(width: 10,),
        InkWell(
          onTap: () async {
            await showMyAboutDialog(context);
          },
          child: const BuildIcon(
            iconPath: "icons/general/threeDots" ,
            boxFit: BoxFit.cover,
            size: 35,
          ),
        ),
        const SizedBox(width: 10,),


      ],
    );
  }

  Future<void> showResetDialog (BuildContext context) async {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final actions = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24);

    DecorationDialog.showMyDialog(context,
        child: Column(
          children: [
            const Spacer(),
            Text(   AppLocalizations.of(context)!.this_operation_turn_this_app_on_by_default_state , style:  bodyLarge?.copyWith(fontSize: 18),),
            const Spacer(),
            Text(
                AppLocalizations.of(context)!.are_you_sure_to_do_this + " ?",
                style:  bodyLarge?.copyWith(color: ColorService.pinkSolid , fontSize: 23)
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.close,
                      style: actions,
                    )),
                TextButton(
                    onPressed: () {
                      box.delete("geolocation");
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.changes_applied_successfully)));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.ok,
                      style: actions,
                    ))
              ],
            )
          ],
        ));
  }

  Future<void> showMyAboutDialog (BuildContext context) async {

    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final actions = Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold  , fontSize: 24);
    final size = MediaQuery.of(context).size;

    return await DecorationDialog.showMyDialog(
        context,
        child: Column(
          children: [
            Text("Weather App" , style:  bodyLarge,),
            const SizedBox(height: 10,),

            BuildIcon(iconPath: "icons/app_icon", size: size.width/4, boxFit: BoxFit.cover,),
            const SizedBox(height: 10,),
            Text("version: 1.1" ,style:  bodySmall),
            const Spacer(),
            Text("Hengell" ,style:  bodySmall?.copyWith(color: ColorService.lightPink  , fontSize: 24)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const  LicensePage()));
                    },
                    child: Text(AppLocalizations.of(context)!.licences , style: actions,)
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(AppLocalizations.of(context)!.close , style: actions,)
                )
              ],
            )
          ],
        )
    );

  }
}
