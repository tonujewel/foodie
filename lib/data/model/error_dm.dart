import 'dart:convert';

ErrorDm errorDmFromJson(String str) => ErrorDm.fromJson(json.decode(str));

String errorDmToJson(ErrorDm data) => json.encode(data.toJson());

class ErrorDm {
  ErrorDm({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory ErrorDm.fromJson(Map<String, dynamic> json) => ErrorDm(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}