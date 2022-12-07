import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodie/config/theme.dart';
import 'package:foodie/resources/app_prefs.dart';

class MyAppRepository {
  ThemeData getTheme() {
    bool isDarkTheme = AppPreferences.getTheme();
    log("theme check $isDarkTheme");
    
    if (isDarkTheme) {
      return AppThemes.darkTheme;
    } else {
      return AppThemes.lightTheme;
    }
  }
}
