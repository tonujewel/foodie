import 'package:dartz/dartz.dart';
import 'package:foodie/data/model/error_dm.dart';
import 'package:foodie/data/model/restaurant_dm.dart';
import 'package:foodie/data/model/user_dm.dart';
import 'package:foodie/utils/app_constant.dart';

import '../../networking/api_manager.dart';
import '../../networking/url.dart';

class RestaurantRepository {
  Future<Either<ErrorDm, RestaurantDm>> getJoke() async {
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

  Future<Either<ErrorDm, UserDm>> loginApiCall() async {
    var body = {
      'email': "tonujewel@gmail.com",
      'password': "1234567",
    };

    var headers = {'Accept': 'application/json'};

    final response = await APIManager.postFromDataAPICall(
      url: Url.signInURL,
      body: body,
      header: headers,
    );

    if (response.toString().contains(AppConstant.errorString)) {
      ErrorDm errorDm = errorDmFromJson(response);
      // log("errorDm :::  ${errorDm.message}");
      return Left(errorDm);
    } else {
      UserDm userDm = userDmFromJson(response);
      return Right(userDm);
    }
  }
}
