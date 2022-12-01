import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/data/repository/restaurant_repository.dart';
import 'package:foodie/resources/color_manager.dart';
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
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(title: const Text("Home"), elevation: 0),
      bottomNavigationBar: const BottomNavigation(),
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const SearchWdiget(),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: height * .06,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const CategoryWidget();
                              }),
                        ),
                        const SizedBox(height: 10),
                        const SectionTitleWidget(),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: height * .32,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.restaurantList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return RestaurantItem(
                                    data: state.restaurantList[index]);
                              }),
                        ),
                      ],
                    ),
                  ),
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

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BottomItem(
            name: "Explore",
            icon: "assets/icon/search.png",
            isSelected: true,
          ),
          BottomItem(
            name: "History",
            icon: "assets/icon/history.png",
            isSelected: false,
          ),
          BottomItem(
            name: "Saved",
            icon: "assets/icon/love.png",
            isSelected: false,
          ),
          BottomItem(
            name: "Profile",
            icon: "assets/icon/search.png",
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  const BottomItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  final String name, icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          height: 25,
          width: 25,
          color: isSelected ? ColorManager.primaryBlueColor : Colors.black,
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            color: isSelected ? ColorManager.primaryBlueColor : Colors.black,
          ),
        )
      ],
    );
  }
}

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "Popular restaurants",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Spacer(),
        Text(
          "View all",
          style: TextStyle(color: ColorManager.primaryBlueColor, fontSize: 16),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: ColorManager.primaryBlueColor,
        )
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              "assets/icon/search.png",
              height: 25,
              color: ColorManager.primaryBlueColor,
            ),
            const SizedBox(width: 10),
            const Text("Restaurant"),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

class SearchWdiget extends StatelessWidget {
  const SearchWdiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("What are you looking for?"),
            Image.asset(
              "assets/icon/search.png",
              height: 25,
              color: ColorManager.primaryBlueColor,
            )
          ],
        ),
      ),
    );
  }
}
