import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mvvm/src/repository/auth_repository.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/utils/utils.dart';

class AuthModel extends ChangeNotifier{

  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){

    _loading = value;
    notifyListeners();

  }

  Future<void> loginApi(dynamic data, BuildContext context) async{

    setLoading(true);

    _myRepo.loginApi(data).then((value){

      setLoading(false);

      log(value.toString());

      Navigator.pushNamed(context, RoutesName.homeScreen);

    }).onError((error, stackTrace){

      setLoading(false);
      Utils.flushBarMessage("Error", error.toString(), context);
      log(error.toString());

    });

  }

}