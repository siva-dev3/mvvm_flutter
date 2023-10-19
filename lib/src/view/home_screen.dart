import 'package:flutter/material.dart';
import 'package:mvvm/src/data/response/status.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/view_model/home_view_model.dart';
import 'package:mvvm/src/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {

    homeViewModel.fetchMoviesListApi();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
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
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _){

            switch(value.moviesList.status){

              case Status.LOADING:
                return const CircularProgressIndicator();
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                    itemBuilder: (context, index){

                      return Card();

                    }
                );
              default:
            }

            return Container();
          }),
      )
    );

  }

}