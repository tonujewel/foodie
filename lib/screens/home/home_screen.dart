import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/data/repository/restaurant_repository.dart';

import '../../resources/size_manager.dart';
import 'bloc/home_bloc.dart';
import 'items/restaurant_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: RepositoryProvider(
        create: (context) =>
            RepositoryProvider.of<RestaurantRepository>(context),
        child: BlocProvider(
          create: (context) => HomeBloc(
            RepositoryProvider.of<RestaurantRepository>(context),
          )..add(LoadRestaurantDataEvent()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              // loading
              if (state is HomeLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              // loaded
              if (state is HomeLoadedState) {
                return Column(
                  children: [
                    Flexible(
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: SizeManager.GAP_BIG,
                            vertical: SizeManager.GAP_REGULAR),
                        itemCount: state.restaurantList.length,
                        itemBuilder: (context, index) {
                          return RestaurantItem(
                              data: state.restaurantList[index]);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 16,
                          childAspectRatio: 2,
                        ),
                      ),
                    ),
                    Flexible(
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: SizeManager.GAP_BIG,
                            vertical: SizeManager.GAP_REGULAR),
                        itemCount: state.restaurantList.length,
                        itemBuilder: (context, index) {
                          return RestaurantItem(
                              data: state.restaurantList[index]);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 16,
                          childAspectRatio: 2,
                        ),
                      ),
                    ),
                  ],
                );
              }

              // error
              if (state is HomeErrorState) {
                return Center(
                  child: Text("Something went wrong ${state.error}"),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
