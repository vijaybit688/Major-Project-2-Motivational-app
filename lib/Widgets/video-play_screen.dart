import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerSeparatePage extends StatefulWidget {
  final String? url;

  const VideoPlayerSeparatePage({Key? key, this.url}) : super(key: key);
  @override
  _VideoPlayerSeparatePageState createState() =>
      _VideoPlayerSeparatePageState();
}

class _VideoPlayerSeparatePageState extends State<VideoPlayerSeparatePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        body: ListView(children: [
          Container(
            child: player(widget.url!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back,size: 27,color: Colors.black,),
              TextButton(
                child: Text(
                  "Back",
                  style: TextStyle(fontSize: 35,color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  if (MediaQuery.of(context).orientation == Orientation.landscape) {
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitUp]);
                  }
                },
              ),
            ],
          )
        ]),
      ),
    );
  }
  Widget player(String url) {
    return Container(
      margin: EdgeInsets.all(10),
      child: YoutubePlayer(
          controller: YoutubePlayerController(
              initialVideoId: url,
              flags: YoutubePlayerFlags(isLive: false, autoPlay: true))),
    );
  }

}
