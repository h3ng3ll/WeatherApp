


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            await showMyAboutDialog(context);
          },
          child: const BuildIcon(
            iconPath: "icons/general/threeDots" ,
            boxFit: BoxFit.cover,
            size: 35,
          ),
        )
      ],
    );
  }

  Future<void> showMyAboutDialog (BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          final size = MediaQuery.of(context).size;
          final bodyLarge = Theme.of(context).textTheme.bodyLarge;
          final bodySmall = Theme.of(context).textTheme.bodySmall;
          final actions = Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold  , fontSize: 24);

          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorService.purpleShade2
              ),
              height: size.height/3,
              width: size.width/2,
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
              ),
            ),
          );
        }
    );
  }
}
