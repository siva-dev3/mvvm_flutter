import 'package:flutter/material.dart';
import 'package:mvvm/src/model/user_model.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/utils/utils.dart';
import 'package:mvvm/src/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: (){

                userPreference.remove().then((value){

                  Navigator.pushNamed(context, RoutesName.loginScreen);

                });

              },
              child: const Text(
                "Log out"
              ),
            ),
          )
        ],
      ),
    );

  }

}