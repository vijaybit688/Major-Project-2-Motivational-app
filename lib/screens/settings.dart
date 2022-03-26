import 'package:flutter/material.dart';
import 'package:quotes/functions/app_bar_return_function.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  _launchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.skytechnohub.quotes';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForHomeAndVideoTabBar()
          .returnAppBarForHomeAndSettings("Motivational Quotes"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 10, bottom: 10),
            child: Text(
              "Settings",
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 10, bottom: 10),
            child: TextButton(
              onPressed: () {
                _launchURL();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Please Rate our app We will be waiting for your review ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
            ),
            child: TextButton(
              onPressed: () {
                _launchURL();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.rate_review,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Give Your Review",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Text("Please Please Rate our app and write a review we get motivation from your review",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),),
            ),
          )
        ],
      ),
    );
  }
}