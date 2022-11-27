import 'package:flutter/material.dart';
import 'package:foodie/data/model/restaurant_dm.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key, required this.data});

  final RestaurantData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 120,
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/loader.gif",
                image:
                    "https://cdn.dribbble.com/users/30252/screenshots/11222647/media/051164f3be4c2923aa4c0dfdd775d87d.png",
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/placeholder.png");
                },
              ),
            ),
          ),
          Text("${data.title}")
        ],
      ),
    );
  }
}
