import 'package:flutter/material.dart';
import 'package:foodie/config/theme.dart';

class MyAppRepository {
  ThemeData getTheme(bool isDark) {
    if (isDark) {
      return AppThemes.darkTheme;
    } else {
      return AppThemes.lightTheme;
    }
  }
}
