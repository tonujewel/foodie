import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/data/model/home_module_dm.dart';
import 'package:foodie/data/repository/restaurant_repository.dart';
import 'package:foodie/resources/color_manager.dart';
import 'package:foodie/resources/string_manager.dart';
import '../../utils/helper.dart';
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
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: RepositoryProvider(
        create: (context) =>
            RepositoryProvider.of<RestaurantRepository>(context),
        child: BlocProvider(
          create: (context) => HomeBloc(
            RepositoryProvider.of<RestaurantRepository>(context),
          )..add(LoadRestaurantDataEvent()),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeLoadingState) {
                AppHelper.loadingDialog(context: context);
              }

              if (state is HomeLoadedState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
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
                        GridView.builder(
                            itemCount: StringManager.homeModuleList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 1.4),
                            itemBuilder: ((context, index) {
                              return HomeModuleWidget(
                                  moduleDm:
                                      StringManager.homeModuleList[index]);
                            })),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
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
                          height: 230,
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

class HomeModuleWidget extends StatelessWidget {
  const HomeModuleWidget({
    Key? key,
    required this.moduleDm,
  }) : super(key: key);

  final HomeModuleDm moduleDm;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              moduleDm.imageUrl,
              height: 40,
            ),
            const SizedBox(height: 10),
            Text(moduleDm.title),
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
