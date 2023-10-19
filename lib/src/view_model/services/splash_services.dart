import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mvvm/src/model/user_model.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/view_model/user_view_model.dart';

class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async{

    getUserData().then((value) async {

      if(value.token.toString() == null || value.token.toString() == '' || value.token.toString() == "null"){

        await Future.delayed(
            const Duration(
                seconds: 3
            )
        );
        Navigator.pushNamed(context, RoutesName.loginScreen);

      }else{

        await Future.delayed(
            const Duration(
                seconds: 3
            )
        );
        Navigator.pushNamed(context, RoutesName.homeScreen);

      }

    }).onError((error, stackTrace){

      log(error.toString());

    });

  }

}