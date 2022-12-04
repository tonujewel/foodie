import 'package:dartz/dartz.dart';
import 'package:foodie/networking/api_manager.dart';

import '../../networking/url.dart';
import '../../utils/app_constant.dart';
import '../model/error_dm.dart';
import '../model/restaurant_dm.dart';

class FoodDeliveryRepository {
  static const int _perPage = 20;
  Future<Either<ErrorDm, RestaurantDm>> getRestaurant(int page) async {
    final response = await APIManager.getAPICall(
        url:
            "${Url.getResataurantDataUrl}?sort_by=all&page=$page&show=$_perPage");

    if (response.toString().contains(AppConstant.errorString)) {
      ErrorDm errorDm = errorDmFromJson(response);
      return Left(errorDm);
    } else {
      RestaurantDm restaurantDm = restaurantDmFromJson(response);
      return Right(restaurantDm);
    }
  }
}
