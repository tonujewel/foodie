import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/data/repository/login_repository.dart';
import 'package:foodie/resources/color_palette.dart';
import 'package:foodie/screens/home/home_screen.dart';
import 'data/repository/restaurant_repository.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LoginRepository()),
        RepositoryProvider(create: (context) => RestaurantRepository()),
        // RepositoryProvider(create: (context) => ConnectivityService()),
        // RepositoryProvider(create: (context) => ApiProvider()),
        // RepositoryProvider(create: (context) => ImageService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        theme: ThemeData(
          primarySwatch: ColorPalette.kToDark,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
