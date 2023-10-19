import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm/src/model/user_model.dart';
import 'package:mvvm/src/repository/auth_repository.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/utils/utils.dart';
import 'package:mvvm/src/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthModel extends ChangeNotifier{

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  setLoading(bool value){

    _loading = value;
    notifyListeners();

  }

  setSignupLoading(bool value){

    _signupLoading = value;
    notifyListeners();

  }

  Future<void> loginApi(dynamic data, BuildContext context) async {

    setLoading(true);

    _myRepo.loginApi(data).then((value){

      setLoading(false);

      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString()
        )
      );

      log(value.toString());
      Utils.flushBarMessage("Success", "LoggedIn Successfully", context, Colors.green);
      Navigator.pushNamed(context, RoutesName.homeScreen);

    }).onError((error, stackTrace){

      setLoading(false);
      Utils.flushBarMessage("Error", error.toString(), context, Colors.red);
      log(error.toString());

    });

  }

  Future<void> signupApi(dynamic data, BuildContext context) async {

    setSignupLoading(true);

    _myRepo.registerApi(data).then((value){

      setSignupLoading(false);
      log(value.toString());
      Utils.flushBarMessage("Success", "Registered Successfully", context, Colors.green);
      Navigator.pushNamed(context, RoutesName.loginScreen);

    }).onError((error, stackTrace){

      setSignupLoading(false);
      Utils.flushBarMessage("Error", error.toString(), context, Colors.red);
      log(error.toString());

    });

  }

}