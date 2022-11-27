import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  RepositoryProvider(
        create: (context) => RestaurantRepository(),
        child: const HomeScreen(),
      ),
    );
  }
}
