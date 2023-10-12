import 'package:flutter/material.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/view/home_screen.dart';
import 'package:mvvm/src/view/login_screen.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_){

              return const Scaffold(
                body: Center(
                  child: Text(
                      "No route Found"
                  ),
                ),
              );

            }
        );

    }

  }

}