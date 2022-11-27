import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:foodie/data/model/error_dm.dart';
import 'package:foodie/data/model/restaurant_dm.dart';
import 'package:foodie/data/model/user_dm.dart';

import '../../networking/api_manager.dart';
import '../../networking/url.dart';

class RestaurantRepository {
  final String _baseUrl = "https://indieat.se/apni/v1/";

  Future<Either<ErrorDm, RestaurantDm>> getJoke() async {
    // final response = await http.get(Uri.parse("${_baseUrl}restaurant/list"));

    // log("Response $response");
    // if (response.statusCode == 200) {
    //   return restaurantDmFromJson(response.body);
    // } else {
    //   throw Exception("Failed to load restaurant data");
    // }
    final response =
        await APIManager.getAPICall(url: Url.getResataurantDataUrl);

    if (response != null) {
      RestaurantDm restaurantDm = restaurantDmFromJson(response);
      return Right(restaurantDm);
    } else {
      ErrorDm errorDm = errorDmFromJson(response);
      return Left(errorDm);
    }

    // // RestaurantDm restaurantDm = restaurantDmFromJson(response);

    // APIManager.getAPICall(url: Url.getResataurantDataUrl).then((value) {
    //   //
    // });
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

    if (response.toString().contains("\"success\":false")) {
      ErrorDm errorDm = errorDmFromJson(response);
      // log("errorDm :::  ${errorDm.message}");
      return Left(errorDm);
    } else {
      UserDm userDm = userDmFromJson(response);
      return Right(userDm);
    }
  }
}
