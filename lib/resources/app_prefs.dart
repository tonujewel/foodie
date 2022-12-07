import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const PREF_KEY_LANG = "PREF_KEY_LANG";
const PREF_KEY_ONBOARDING_SCREEN = "PREF_KEY_ONBOARDING_SCREEN";
const PREF_KEY_IS_USER_LOGGED_IN = "PREF_KEY_IS_USER_LOGGED_IN";
const PREF_KEY_TOKEN = "PREF_KEY_TOKEN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  // ....... TOKEN ....... ///

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(PREF_KEY_TOKEN, "Bearer $token");
  }

  Future<String> getToken() async {
    return _sharedPreferences.getString(PREF_KEY_TOKEN) ?? "No token found";
  }

  // ....... ON BOARDING ....... ///
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PREF_KEY_ONBOARDING_SCREEN, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREF_KEY_ONBOARDING_SCREEN) ?? false;
  }

  // ....... LOGIN ....... ///
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREF_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREF_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    await _sharedPreferences.remove(PREF_KEY_IS_USER_LOGGED_IN);
  }
}
