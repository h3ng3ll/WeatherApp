


import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/presentation/UI/WeatherSearchScreen/widget/BuildWeatherSearchBar/BuildWeatherSearchBarShape.dart';
import 'package:weather_app/src/presentation/provider/SearchWeatherProvider.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';

class BuildWeatherSearchBar extends StatelessWidget {
  const BuildWeatherSearchBar({Key? key}) : super(key: key);



  void onChanged (String value , BuildContext context) {
    Provider.of<SearchWeatherProvider>(context , listen: false)
        .request = value;
  }

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w400);
    final bodyLarge = Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 28);

    return BuildWeatherSearchBarShape(
      child: Stack(
        children: [
          Positioned.fill(
            child: TextField(
              onChanged: (value) => onChanged(value , context),
              style: bodyLarge,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: AppLocalizations.of(context)!.search_for_a_city_or_airport,
                hintStyle: titleSmall,
                /// plugger for search Icon
                prefix: const SizedBox(width: 35),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                // focusColor: ColorService.transparent,
              ),
            ),
          ),
          const Positioned(
              top: 6,
              child: Icon(
                Icons.search ,
                color: ColorService.greySecondary,
                size: 35,
              )
          )
        ],
      ),
    );
  }
}
