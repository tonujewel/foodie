import 'package:dartz/dartz.dart';
import 'package:foodie/data/model/error_dm.dart';
import 'package:foodie/data/model/restaurant_dm.dart';
import 'package:foodie/utils/app_constant.dart';

import '../../networking/api_manager.dart';
import '../../networking/url.dart';

class RestaurantRepository {
  Future<Either<ErrorDm, RestaurantDm>> getRestaurant() async {
    final response =
        await APIManager.getAPICall(url: Url.getResataurantDataUrl);

    if (response.toString().contains(AppConstant.errorString)) {
      ErrorDm errorDm = errorDmFromJson(response);
      return Left(errorDm);
    } else {
      RestaurantDm restaurantDm = restaurantDmFromJson(response);
      return Right(restaurantDm);
    }
  }
}
