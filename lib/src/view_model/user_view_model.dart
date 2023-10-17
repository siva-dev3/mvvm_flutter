import 'package:flutter/material.dart';
import 'package:mvvm/src/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  Future<bool> saveUser(UserModel user) async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.toString());

    return true;

  }

  Future<UserModel> getUser() async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? getToken = sp.getString("token");

    return UserModel(
      token: getToken
    );

  }

  Future<bool> remove() async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
    return true;

  }

}