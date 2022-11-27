import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/data/repository/restaurant_repository.dart';
import 'package:foodie/resources/size_manager.dart';
import 'package:foodie/screens/home/items/restaurant_item.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<RestaurantRepository>(context),
      )..add(LoadRestaurantDataEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            // loading
            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            // loaded
            if (state is HomeLoadedState) {
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SizeManager.GAP_BIG,
                      vertical: SizeManager.GAP_REGULAR),
                  itemCount: state.restaurantList?.length,
                  itemBuilder: (context, index) {
                    return RestaurantItem(data: state.restaurantList![index]);
                  });
            }

            // error
            if (state is HomeErrorState) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
