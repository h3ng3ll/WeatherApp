


import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/core/BuildIcon.dart';
import 'package:weather_app/src/presentation/services/ColorService.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DecorationDialog {


  static Future<void> showMyDialog (BuildContext context ,{required Widget child}) async {
    return showDialog(
        context: context,
        builder: (context) {
          final size = MediaQuery
              .of(context)
              .size;

          return Dialog(
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorService.purpleShade2
                ),
                height: size.height / 3,
                width: size.width / 2,
                child: child
            ),
          );
        }
    );
  }
}