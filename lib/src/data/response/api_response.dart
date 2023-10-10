import 'package:mvvm/src/data/response/status.dart';

class ApiResponse<T>{

  Status? status;
  T? data;
  String? message;

  ApiResponse([this.status, this.data, this.message]);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  String toString(){

    return 'Status : $status \n Data : $data \n Message : $message';

  }

}