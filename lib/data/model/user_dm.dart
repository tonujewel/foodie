// To parse this JSON data, do
//
//     final userDm = userDmFromJson(jsonString);

import 'dart:convert';

UserDm userDmFromJson(String str) => UserDm.fromJson(json.decode(str));

String? userDmToJson(UserDm data) => json.encode(data.toJson());

class UserDm {
  UserDm({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory UserDm.fromJson(Map<String, dynamic> json) => UserDm(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.role,
    this.email,
    this.phone,
    this.balance,
    this.currencyId,
    this.currencyCode,
    this.locale,
    this.address,
    this.lat,
    this.lng,
    this.image,
    this.token,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  String? phone;
  String? balance;
  int? currencyId;
  String? currencyCode;
  String? locale;
  dynamic address;
  dynamic lat;
  dynamic lng;
  String? image;
  String? token;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        role: json["role"],
        email: json["email"],
        phone: json["phone"],
        balance: json["balance"],
        currencyId: json["currency_id"],
        currencyCode: json["currency_code"],
        locale: json["locale"],
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
        image: json["image"],
        token: json["token"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "role": role,
        "email": email,
        "phone": phone,
        "balance": balance,
        "currency_id": currencyId,
        "currency_code": currencyCode,
        "locale": locale,
        "address": address,
        "lat": lat,
        "lng": lng,
        "image": image,
        "token": token,
      };
}
