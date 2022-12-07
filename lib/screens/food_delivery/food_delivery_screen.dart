import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/data/model/restaurant_dm.dart';
import 'package:foodie/data/repository/food_delivery_repository.dart';
import '../../resources/color_manager.dart';
import '../../utils/helper.dart';
import 'bloc/food_delivery_bloc.dart';

class FoodDeliveryScreen extends StatelessWidget {
  const FoodDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FoodDeliveryBloc(FoodDeliveryRepository())..add(FetchFoodDelivery()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Food delivery"),
          elevation: 0,
        ),
        body: FoodDeliveryBody(),
      ),
    );
  }
}

class FoodDeliveryBody extends StatelessWidget {
  FoodDeliveryBody({
    Key? key,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  List<RestaurantData> result = [];

  bool isLoading = false;

  bool isLoadFirstTime = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodDeliveryBloc, FoodDeliveryState>(
      listener: (context, state) {
        if (state is FoodDeliveryLoading) {
          if (!isLoadFirstTime) {
            AppHelper.loadingDialog(context: context);
          }
        }

        if (state is FoodDeliveryLoaded) {
          if (state.restaurantList.length > result.length) {
            isLoading = false;
          }
          result = state.restaurantList;

          if (!isLoadFirstTime) {
            Navigator.pop(context);
            isLoadFirstTime = true;
          }
        }

        if (state is FoodDeliveryError) {
          if (!isLoadFirstTime) {
            Navigator.pop(context);
            isLoadFirstTime = true;
          }
        }
        return;
      },
      builder: (context, state) {
        return GridView.builder(
          controller: _scrollController
            ..addListener(() {
              if (_scrollController.position.pixels.toInt() >
                  _scrollController.position.maxScrollExtent.toInt() * .5) {
                if (!isLoading) {
               
                  isLoading = true;
                  BlocProvider.of<FoodDeliveryBloc>(context)
                      .add(FetchFoodDelivery());
                }
              }
            }),
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 3.3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: result.length,
          itemBuilder: (BuildContext ctx, index) {
            return FoodDeliveryItem(
              data: result[index],
            );
          },
        );
      },
    );
  }
}

class FoodDeliveryItem extends StatelessWidget {
  const FoodDeliveryItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final RestaurantData data;

  final String imageUrl =
      "https://img.pikbest.com/backgrounds/20210716/youtube-video-thumbnail-for-food-and-restaurant-business_6039890.jpg";

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  child: FadeInImage.assetNetwork(
                    height: 100,
                    width: 240,
                    fit: BoxFit.cover,
                    placeholder: "assets/images/loader.gif",
                    image: imageUrl,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/images/placeholder.png");
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7),
                    Text(
                      "${data.title}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icon/location.png",
                          height: 20,
                          color: ColorManager.primaryBlueColor,
                        ),
                        const SizedBox(width: 5),
                        Text("5.4 km"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              height: 35,
              width: 35,
              child: Center(
                  child: Text(
                "${data.id}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 35,
              width: 35,
              child: Center(
                  child: Image.asset(
                "assets/icon/wishlist.png",
                height: 20,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
