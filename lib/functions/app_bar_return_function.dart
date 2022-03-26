import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppBarForAll {
  AppBar returnAppBar({BuildContext? context,required String title,required Icon icon}) {
    return AppBar(
      leading: IconButton(
          icon: icon,
          onPressed: () {
            Navigator.pop(context!);
          }),
      backgroundColor: Colors.white,
      elevation: 5,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 27,
            child: Image(
              image: AssetImage("images/a.png"),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
          title,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class AppBarForHomeAndVideoTabBar{

  AppBar returnAppBarForHomeAndSettings(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 27,
            child: Image(
              image: AssetImage("images/a.png"),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ],
      ),
    );
  }
}