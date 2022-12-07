import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/my_app.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
