import 'dart:developer';

import 'package:mvvm/src/data/network/BaseApiServices.dart';
import 'package:mvvm/src/data/network/NetworkApiServices.dart';
import 'package:mvvm/src/model/movie_model.dart';
import 'package:mvvm/src/res/app_urls.dart';

class HomeRepository{

  BaseApiService _apiService = NetworkApiService();

  Future<MovieListModel> fetchMoviesList() async{

    try{

      dynamic response = await _apiService.getGetApiResponse(AppUrl.apiUrlEndPoint);
      return response;

    }catch(e){

      throw e;

    }

  }

}