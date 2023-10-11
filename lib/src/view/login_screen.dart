import 'package:flutter/material.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: (){

                Navigator.pushNamed(context, RoutesName.homeScreen);

              },
              child: const Text(
                "login"
              ),
            ),
          )
        ],
      ),
    );
  }
}
