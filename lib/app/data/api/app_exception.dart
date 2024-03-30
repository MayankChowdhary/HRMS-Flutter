class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException({required String message}) : super(message, "");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "");
}

class UnProcessableEntity extends AppException {
  UnProcessableEntity([message]) : super(message, "");
}

class UnAuthorisedException extends AppException {
  UnAuthorisedException([message]) : super(message, "");
}

class ForbiddenException extends AppException {
  ForbiddenException([message]) : super(message, "");
}

class InvalidInputException extends AppException {
  InvalidInputException({required String message}) : super(message, "");
}
