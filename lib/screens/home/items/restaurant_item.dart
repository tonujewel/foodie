import 'package:flutter/material.dart';
import 'package:foodie/data/model/restaurant_dm.dart';
import 'package:foodie/resources/color_manager.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key, required this.data});

  final RestaurantData data;

  final String imageUrl =
      "https://img.pikbest.com/backgrounds/20210716/youtube-video-thumbnail-for-food-and-restaurant-business_6039890.jpg";

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          SizedBox(
            width: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    child: FadeInImage.assetNetwork(
                      height: 150,
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.title}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon/cloche.png",
                            height: 20,
                            color: ColorManager.primaryBlueColor,
                          ),
                          const SizedBox(width: 10),
                          const Text("Restaurant"),
                          const SizedBox(width: 20),
                          Image.asset(
                            "assets/icon/location.png",
                            height: 20,
                            color: ColorManager.primaryBlueColor,
                          ),
                          const SizedBox(width: 5),
                          Text("${data.avgSiteRating}.4 km"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              height: 35,
              width: 35,
              child: const Center(
                  child: Text(
                "9.5",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
