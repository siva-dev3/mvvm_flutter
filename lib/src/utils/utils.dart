import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus){

    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }

  static toastMessage(String message){

    Fluttertoast.showToast(
        msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white
    );

  }

  static flushBarMessage(String title, String message, BuildContext context, Color bgColor){
    
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10
          ),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          title: title,
          backgroundColor: bgColor,
          duration: const Duration(
              seconds: 3
          ),
          message: message,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
        )..show(context)
    );

  }

  static snackBar(String message, BuildContext context){
    
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
            content: Text(
                message
            )
        )
    );
    
  }

}