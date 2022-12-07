//------ key --------

import 'package:foodie/main.dart';

const PREF_KEY_LANG = "PREF_KEY_LANG";
const PREF_KEY_ONBOARDING_SCREEN = "PREF_KEY_ONBOARDING_SCREEN";
const PREF_KEY_IS_USER_LOGGED_IN = "PREF_KEY_IS_USER_LOGGED_IN";
const PREF_KEY_TOKEN = "PREF_KEY_TOKEN";
const PREF_KEY_THEME = "PREF_KEY_THEME";

class AppPreferences {

  // Theme
static  bool getTheme() {
    bool data = prefs?.getBool(PREF_KEY_THEME) ?? false;
    return data;
  }

 static Future<void> setTheme(bool value) async {
   await prefs?.setBool(PREF_KEY_THEME, value);
  }
}
