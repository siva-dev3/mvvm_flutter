import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm/src/res/components/round_btn.dart';
import 'package:mvvm/src/utils/utils.dart';

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
  Widget build(BuildContext context) {

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
              onPressed: (){

                if(_emailController.text.isEmpty){

                  Utils.flushBarMessage("Error", "Please enter Email", context);

                }else if(_passController.text.isEmpty){

                  Utils.flushBarMessage("Error", "Please enter password", context);

                }else if(_passController.text.length < 6){

                  Utils.flushBarMessage("Error", "Please must be 8 characters", context);

                }else{

                  log("api hit");

                }

              }

          )
        ],
      ),
    );

  }

}