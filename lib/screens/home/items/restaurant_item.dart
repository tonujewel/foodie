import 'package:flutter/material.dart';
import 'package:foodie/data/model/restaurant_dm.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key, required this.data});

  final RestaurantData data;

  final demoImage =
      "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1398&q=80";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.network(
        //   data.thumbnail ?? demoImage,
        //   height: 100,
        // ),
        FadeInImage.assetNetwork(
          placeholder: demoImage,
          image: 'https://picsum.photos/250?image=9',
        ),

        // Image.network(
        //   "${data.thumbnail}",
        //   fit: BoxFit.fill,
        //   errorBuilder: (context, error, stackTrace) {
        //     return Text("data");
        //   },
        //   loadingBuilder: (BuildContext context, Widget child,
        //       ImageChunkEvent? loadingProgress) {
        //     if (loadingProgress == null) return child;
        //     return Center(
        //       child: CircularProgressIndicator(
        //         value: loadingProgress.expectedTotalBytes != null
        //             ? loadingProgress.cumulativeBytesLoaded /
        //                 loadingProgress.expectedTotalBytes!
        //             : null,
        //       ),
        //     );
        //   },
        // ),

        Text("${data.title}")
      ],
    );
  }
}
