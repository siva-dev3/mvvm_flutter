import 'dart:developer';

import 'package:mvvm/src/data/network/BaseApiServices.dart';
import 'package:mvvm/src/data/network/NetworkApiServices.dart';
import 'package:mvvm/src/res/app_urls.dart';

class AuthRepository{

  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{

    try{

      dynamic response = await _apiService.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;

    }catch(e){

      log(e.toString());
      throw e;

    }

  }

  Future<dynamic> registerApi(dynamic data) async{

    try{

      dynamic response = await _apiService.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;

    }catch(e){

      log(e.toString());
      throw e;

    }

  }

}