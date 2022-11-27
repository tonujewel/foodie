import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'dart:io';
import 'dart:async';
import 'custom_exception.dart';
import 'package:http_parser/http_parser.dart';

class APIManager {
  static Future<dynamic> postFromDataAPICall(
      {required String url,
      Map<String, String>? body,
      Map<String, String>? header}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      if (header != null) {
        responseJson = http.MultipartRequest("POST", Uri.parse(url))
          ..headers.addAll(header)
          ..fields.addAll(body!);
      } else {
        responseJson = http.MultipartRequest("POST", Uri.parse(url))
          ..fields.addAll(body!);
      }

      final streamedResponse = await responseJson.send();
      var response = await http.Response.fromStream(streamedResponse)
          .timeout(const Duration(seconds: 30));

      if (kDebugMode) {
        debugPrint("URL:: $url");
        debugPrint("BODY:: $body");
        debugPrint("RESPONSE:: ${response.body}");
      }

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }

  static Future<dynamic> postAPICall(
      {required String url,
      Map<String, String>? body,
      Map<String, String>? header}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    var headers = {'Content-Type': 'application/json'};
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode(body);
      request.headers.addAll(header ?? headers);

      http.StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse)
          .timeout(const Duration(seconds: 30));
      debugPrint("URL:: $url");
      debugPrint("BODY:: $body");
      debugPrint("RESPONSE:: ${response.body}");
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }

  static Future<dynamic> postFileAPICall(
      {required String url,
      required Map<String, String> body,
      required Map<String, String> header,
      var filePathName,
      var filePath}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final mimeTypeData =
          lookupMimeType(filePath, headerBytes: [0xFF, 0xD8])?.split('/');
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
            url,
          ));
      request.headers.addAll(header);
      if (filePath != "") {
        request.files.add(await http.MultipartFile.fromPath(
            '$filePathName', filePath,
            contentType: MediaType(mimeTypeData![0], mimeTypeData[1])));
      }

      request.fields.addAll(body);

      http.StreamedResponse res = await request.send();

      var response = await http.Response.fromStream(res)
          .timeout(const Duration(minutes: 1));
      debugPrint("URL:: $url");
      debugPrint("BODY:: $body");
      debugPrint("RESPONSE:: ${response.body}");
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }

  static Future<dynamic> deleteAPICall(
      {required String url, Map<String, String>? header}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      var request = http.Request('DELETE', Uri.parse(url));
      request.headers.addAll(header!);
      http.StreamedResponse response = await request.send();

      var responseString = await http.Response.fromStream(response);
      responseJson = _response(responseString);
      debugPrint("URL:: $url");
      debugPrint("RESPONSE:: ${responseString.body}");
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }

  static Future<dynamic> getAPICall(
      {required String url, Map<String, String>? header}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 30));

      if (response.body.toString().contains('Unauthenticated')) {
        // Get.offAll(() => LoginScreen());
      }

      // ignore: avoid_print
      print("URL:: $url");
      // ignore: avoid_print
      print("Method:: GET");
      // ignore: avoid_print
      print("RESPONSE:: ${response.body}");

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('_no_internet');
    } on TimeoutException {
      throw TimeOutException();
    }
    return responseJson;
  }
}

dynamic _response(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body.toString();
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
      throw InternalServerError(response.body.toString());
    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
  }
}

// void apiErrorMessage(String msg) {
//   if (msg == "Time Out: null") {
//     errorSnackbar("Network time out");
//   } else if (msg == "Error_no_internet") {
//     errorSnackbar("Check your internet connection");
//   } else {
//     errorSnackbar(msg);
//   }
// }
