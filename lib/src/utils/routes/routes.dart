import 'package:flutter/material.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/view/home_screen.dart';
import 'package:mvvm/src/view/login_view.dart';
import 'package:mvvm/src/view/signup_view.dart';
import 'package:mvvm/src/view/splash_view.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUp());

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