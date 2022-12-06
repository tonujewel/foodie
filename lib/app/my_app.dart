import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/app/bloc/my_app_bloc.dart';
import 'package:foodie/data/repository/my_app_repositoty.dart';
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
        RepositoryProvider(create: (context) => MyAppRepository()),
      ],
      child: BlocProvider(
        create: (context) =>
            MyAppBloc(RepositoryProvider.of<MyAppRepository>(context)),
        child: BlocBuilder<MyAppBloc, MyAppState>(
          builder: (context, state) {
            if (state is MyAppInitial) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Restaurant App',
                theme: state.themeData,
                home: const BaseScreen(),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
