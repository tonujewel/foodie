import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/config/theme.dart';
import '../data/repository/food_delivery_repository.dart';
import '../data/repository/login_repository.dart';
import '../data/repository/restaurant_repository.dart';
import '../screens/base_screen/base_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LoginRepository()),
        RepositoryProvider(create: (context) => RestaurantRepository()),
        RepositoryProvider(create: (context) => FoodDeliveryRepository()),
      ],
      child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Restaurant App',
              theme: AppThemes.lightTheme,
              home: const BaseScreen(),
            ),
    );
  }
}
