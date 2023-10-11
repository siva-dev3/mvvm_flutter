import 'package:flutter/material.dart';
import 'package:mvvm/src/utils/routes/routes.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      initialRoute: RoutesName.homeScreen,
      onGenerateRoute: Routes.generateRoute,
    );

  }

}