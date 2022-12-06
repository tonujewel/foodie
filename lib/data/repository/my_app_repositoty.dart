import 'package:flutter/material.dart';
import 'package:foodie/config/theme.dart';

class MyAppRepository {
  ThemeData getTheme(bool isLight) {
    if (isLight) {
      return AppThemes.lightTheme;
    } else {
      return AppThemes.darkTheme;
    }
  }
}
