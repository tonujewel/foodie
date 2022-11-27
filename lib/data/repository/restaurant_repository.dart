import 'dart:convert';
import 'dart:developer';

import 'package:foodie/data/model/restaurant_dm.dart';
import 'package:http/http.dart' as http;

class RestaurantRepository {
  final String _baseUrl = "https://indieat.se/api/v1/";

  Future<RestaurantDm> getJoke() async {
    final response = await http.get(Uri.parse("${_baseUrl}restaurant/list"));

    log("Response $response");
    if (response.statusCode == 200) {
      return restaurantDmFromJson(response.body);
    } else {
      throw Exception("Failed to load restaurant data");
    }
  }
}
