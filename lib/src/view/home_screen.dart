import 'package:flutter/material.dart';
import 'package:mvvm/src/utils/routes/routes.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: (){

                Navigator.pushNamed(context, RoutesName.loginScreen);

              },
              child: const Text(
                "Home Screen"
              ),
            ),
          )
        ],
      ),
    );
  }
}
