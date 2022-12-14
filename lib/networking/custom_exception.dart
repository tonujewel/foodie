

class CustomException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "Error");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "");
}

class InvalidRequestException extends CustomException {
  InvalidRequestException([message]) : super(message, "");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class TimeOutException extends CustomException {
  TimeOutException([String? message]) : super(message, "Time Out: ");
}

class InternalServerError extends CustomException {
  InternalServerError([String? message]) : super(message);
}
