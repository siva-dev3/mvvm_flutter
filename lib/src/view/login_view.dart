import 'package:flutter/material.dart';
import 'package:mvvm/src/res/components/round_btn.dart';
import 'package:mvvm/src/utils/routes/routes_name.dart';
import 'package:mvvm/src/utils/utils.dart';
import 'package:mvvm/src/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final ValueNotifier<bool> _passwordObserver = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  @override
  void dispose() {

    super.dispose();

    _passController.dispose();
    _emailController.dispose();
    _passController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();

  }

  @override
  Widget build(BuildContext context) {

    final authModel = Provider.of<AuthModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            focusNode: emailFocusNode,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "email",
              labelText: "Email",
              prefixIcon: Icon(
                Icons.alternate_email
              )
            ),
            onFieldSubmitted: (value){

              Utils.fieldFocusChange(context, emailFocusNode, passFocusNode);

            },
          ),
          ValueListenableBuilder(
              valueListenable: _passwordObserver,
              builder: (context, value, child){

                return TextFormField(
                  controller: _passController,
                  obscureText: _passwordObserver.value,
                  focusNode: passFocusNode,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                          Icons.alternate_email
                      ),
                      hintText: "password",
                      labelText: "Password",
                      suffixIcon: InkWell(
                        onTap: (){

                          _passwordObserver.value = !_passwordObserver.value;

                        },
                        child: const Icon(
                            Icons.visibility_off
                        ),
                      )
                  ),
                );

              }
          ),
          RoundButton(
              title: "Login",
              loading: authModel.loading,
              onPressed: (){

                if(_emailController.text.isEmpty){

                  Utils.flushBarMessage("Error", "Please enter Email", context, Colors.red);

                }else if(_passController.text.isEmpty){

                  Utils.flushBarMessage("Error", "Please enter password", context, Colors.red);

                }else if(_passController.text.length < 6){

                  Utils.flushBarMessage("Error", "Please must be 8 characters", context, Colors.red);

                }else{

                  Map data = {
                    'email' : _emailController.text.toString(),
                    'password' : _passController.text.toString()
                  };

                  authModel.loginApi(data, context);

                }

              }

          ),
          InkWell(
            onTap: (){

              Navigator.pushNamed(context, RoutesName.signupScreen);

            },
            child: const Text(
              "Don't have an account.. Sign up"
            ),
          )
        ],
      ),
    );

  }

}