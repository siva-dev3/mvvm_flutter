import 'dart:convert';
import 'dart:io';

import 'package:mvvm/src/data/app_exceptions.dart';
import 'package:mvvm/src/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService{

  @override
  Future getGetApiResponse(String url) async {

    dynamic responseJSON;

    try{

      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 15));
      responseJSON = returnResponse(response);

    }on SocketDirection{

      throw FetchDataException('No internet connection');

    }

    return responseJSON;
  }

  @override
  Future getPostApiResponse(String url, data) async {

    dynamic responseJSON;

    try{

      final response = await http.post(
          Uri.parse(url),
          body: jsonEncode(data)
      ).timeout(const Duration(seconds: 15));

      responseJSON = returnResponse(response);

    }on SocketDirection{

      throw FetchDataException('No internet connection');

    }

    return responseJSON;

  }

  dynamic returnResponse(http.Response response){

    switch(response.statusCode){

      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException(response.body.toString());

      default:
        throw FetchDataException('Error occurs while communicating with the sever ' + 'with response code : ' + response.statusCode.toString());

    }

  }

}
