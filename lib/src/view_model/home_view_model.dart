import 'package:flutter/cupertino.dart';
import 'package:mvvm/src/data/response/api_response.dart';
import 'package:mvvm/src/model/movie_model.dart';
import 'package:mvvm/src/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier{

  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response){

    moviesList = response;

  }

  Future<void> fetchMoviesListApi() async{

    setMoviesList(ApiResponse.loading());

    _myRepo.fetchMoviesList().then((value){
      
      setMoviesList(ApiResponse.completed(value));
    
    }).onError((error, stackTrace){

      setMoviesList(ApiResponse.error(error.toString()));

    });

  }

}