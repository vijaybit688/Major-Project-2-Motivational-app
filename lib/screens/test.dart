import 'package:flutter/material.dart';
import 'package:quotes/servises/networking/NetworkHelper.dart';
import 'package:quotes/servises/unsplash_api/unsplash_api_endpoints.dart';
import 'package:quotes/servises/youtube_api/youtube_api_endpoints.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: ()async{
                var helper= await NetworkHelper(url:YouTubeApiClass().getListOfVideoUrlEndpoint("motivational")).getResponse();
                   print(helper);
                for(int i=0;i<5;i++){
                  //items[2].id.videoId

                  //items[2].snippet.title



                  //items[1].snippet.thumbnails.medium.url
                  print(helper['items'][i]['id']['videoId']);
                 print(helper);
                 print(helper);
                  }
                 },
            child: Container(
              height: 40,
              width: 40,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
