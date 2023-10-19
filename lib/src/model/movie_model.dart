class MovieListModel{

  String? movie;

  MovieListModel({this.movie});

  MovieListModel.fromJson(Map<String, dynamic> json){

    movie = json['movie'];

  }

  Map<String, dynamic> toJson(){

    final Map<String, dynamic> data = Map<String, dynamic>();
    data['movie'] = this.movie;
    return data;

  }

}