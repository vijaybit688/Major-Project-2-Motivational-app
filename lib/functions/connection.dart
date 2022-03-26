import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<dynamic> checkConnection(BuildContext context) async {
  bool result = await InternetConnectionChecker().hasConnection;

  if (result == true) {
    print('YAY! Free cute dog pics!');
  } else {
    print('No internet :( Reason:');
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alert !!!"),
            content: Text("No Internet Connection"),
            actions: [
              TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }
  return "Nothing";
}