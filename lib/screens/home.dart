import 'package:flutter/material.dart';
import 'package:quotes/functions/app_bar_return_function.dart';
import 'package:quotes/functions/external_functions.dart';
List list=[];
class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar:  AppBarForHomeAndVideoTabBar().returnAppBarForHomeAndSettings("Motivational Quotes"),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 17, top: 10, bottom: 10),
                        child: Text(
                          "Motivational Category",
                          style: TextStyle(color: Colors.black, fontSize: 27),
                        ),
                      ),
                      returnRowForCategory(context, "Category 1", "/first",
                          list[0]),
                      returnRowForCategory(context, "Category 2", "/second",
                          list[1]),
                      returnRowForCategory(context, "Category 3", "/third",
                          list[2]),
                      returnRowForCategory(context, "Category 4", "/fourth",
                          list[3]),
                    ],
                  )
                ],
              ),
            )));
  }
}
