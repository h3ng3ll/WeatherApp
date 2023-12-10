import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/l10n/L10n.dart';
import 'package:weather_app/src/data/services/locale/hive/gelocationHive/geolocation_hive.dart';
import 'package:weather_app/src/presentation/UI/MainWeatherScreen/MainWeatherScreen.dart';
import 'package:weather_app/src/presentation/core/DefaultTheme.dart';
import 'package:weather_app/src/presentation/provider/SearchWeatherProvider.dart';
import 'package:weather_app/src/presentation/provider/UpPanelProvider.dart';
import 'package:weather_app/src/presentation/provider/WeatherProvider.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

late Box box ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(GeolocationHiveAdapter());

  box = await Hive.openBox("location");


  ByteData data = await PlatformAssetBundle().load("assets/ca/imgCertificate.pem");
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asInt8List());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown , DeviceOrientation.portraitUp  ]);

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: ColorService.transparent
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context , child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaleFactor: 0.85,
                // navigationMode: NavigationMode.
            ),
            child: child!
        );
      },
      supportedLocales: L10n.locals,
      debugShowCheckedModeBanner: false,
      // routes: ,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => UpPanelProvider()),
          ChangeNotifierProvider(create: (BuildContext context) => SearchWeatherProvider(context)),
          Provider(create: (context) => WeatherProvider())
        ],
        child: const MainWeatherScreen(),
      ),
    );
  }
}

