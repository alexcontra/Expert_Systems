import 'package:expertsystems/design_specs/radiuses.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static ButtonStyle setButtonStandardStyle(Color buttonColor) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadiuses.radius10)),
      )),
    );
  }
}
