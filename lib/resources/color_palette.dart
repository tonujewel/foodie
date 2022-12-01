import 'package:flutter/material.dart';

class ColorPalette {
  static const MaterialColor kToDark = MaterialColor(
    0xFFf2631f, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfff37335), //10%
      100: Color(0xfff5824c), //20%
      200: Color(0xfff69262), //30%
      300: Color(0xfff7a179), //40%
      400: Color(0xfff9b18f), //50%
      500: Color(0xfffac1a5), //60%
      600: Color(0xfffbd0bc), //70%
      700: Color(0xfffce0d2), //80%
      800: Color(0xfffeefe9), //90%
      900: Color(0xffffffff), //100%
    },
  );
}
