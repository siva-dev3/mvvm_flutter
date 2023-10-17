import 'package:flutter/material.dart';
import 'package:mvvm/src/utils/routes/routes.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/view_model/auth_view_model.dart';
import 'package:mvvm/src/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthModel()
        ),
        ChangeNotifierProvider(
            create: (_) => UserViewModel()
        )
      ],
      child: const MaterialApp(
        initialRoute: RoutesName.loginScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );

  }

}