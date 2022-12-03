import 'package:foodie/data/model/home_module_dm.dart';

class StringManager {
  static final List<HomeModuleDm> homeModuleList = [
    HomeModuleDm(
      id: 1,
      title: "Delivery",
      imageUrl: "assets/home/delivery.png",
    ),
    HomeModuleDm(
      id: 2,
      title: "Reservation",
      imageUrl: "assets/home/reservation.png",
    ),
    HomeModuleDm(
      id: 3,
      title: "Pickup",
      imageUrl: "assets/home/pickup.png",
    ),
    HomeModuleDm(
      id: 4,
      title: "Shop",
      imageUrl: "assets/home/store.png",
    ),
  ];
}
