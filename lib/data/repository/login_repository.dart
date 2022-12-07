import 'package:dartz/dartz.dart';

import '../../networking/api_manager.dart';
import '../../networking/url.dart';
import '../../utils/app_constant.dart';
import '../model/error_dm.dart';
import '../model/user_dm.dart';

class LoginRepository {
  Future<Either<ErrorDm, UserDm>> loginApiCall(
      String email, String password) async {
    var body = {
      'email': email,
      'password': password,
    };

    var headers = {'Accept': 'application/json'};

    final response = await APIManager.postFromDataAPICall(
      url: Url.signInURL,
      body: body,
      header: headers,
    );

    if (response.toString().contains(AppConstant.errorString)) {
      ErrorDm errorDm = errorDmFromJson(response);
    
      return Left(errorDm);
    } else {
      UserDm userDm = userDmFromJson(response);
      return Right(userDm);
    }
  }
}
