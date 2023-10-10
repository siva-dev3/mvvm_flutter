class AppException implements Exception{

  final _messages;
  final _prefix;

  AppException([this._prefix, this._messages]);

  String toString(){

    return '$_prefix$_messages';

  }

}

class FetchDataException extends AppException{

  FetchDataException([String? messages]) : super(messages, 'Error during Communication');

}

class BadRequestException extends AppException{

  BadRequestException([String? messages]) : super(messages, 'Invalid Request');

}

class UnauthorisedException extends AppException{

  UnauthorisedException([String? messages]) : super(messages, 'Unauthorised request');

}