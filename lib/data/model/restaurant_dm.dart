// To parse this JSON data, do
//
//     final restaurantDm = restaurantDmFromJson(jsonString);

import 'dart:convert';

RestaurantDm restaurantDmFromJson(String str) =>
    RestaurantDm.fromJson(json.decode(str));

String? restaurantDmToJson(RestaurantDm data) => json.encode(data.toJson());

class RestaurantDm {
  RestaurantDm({
    this.success,
    this.message,
    this.result,
  });

  bool? success;
  String? message;
  Result? result;

  factory RestaurantDm.fromJson(Map<String?, dynamic> json) => RestaurantDm(
        success: json["success"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String?, dynamic> toJson() => {
        "success": success,
        "message": message,
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    this.data,
  });

  List<RestaurantData>? data;

  factory Result.fromJson(Map<String?, dynamic> json) => Result(
        data: List<RestaurantData>.from(
            json["data"].map((x) => RestaurantData.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RestaurantData {
  RestaurantData({
    this.id,
    this.thumbnail,
    this.title,
    this.avgDeliveryTime,
    this.avgSiteRating,
    this.budget,
    this.categoryName,
    this.cityName,
  });

  dynamic id;
  String? thumbnail;
  String? title;
  dynamic avgDeliveryTime;
  dynamic avgSiteRating;
  String? budget;
  String? categoryName;
  String? cityName;

  factory RestaurantData.fromJson(Map<String?, dynamic> json) => RestaurantData(
        id: json["id"],
        thumbnail: json["thumbnail"],
        title: json["title"],
        avgDeliveryTime: json["avg_delivery_time"],
        avgSiteRating: json["avg_site_rating"],
        budget: json["budget"],
        categoryName: json["category_name"],
        cityName: json["city_name"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "title": title,
        "avg_delivery_time": avgDeliveryTime,
        "avg_site_rating": avgSiteRating,
        "budget": budget,
        "category_name": categoryName,
        "city_name": cityName,
      };
}
