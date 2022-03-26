import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:quotes/Constant/Constants.dart';
import 'package:quotes/Widgets/video-play_screen.dart';
import 'package:quotes/functions/app_bar_return_function.dart';
import 'package:quotes/servises/networking/NetworkHelper.dart';
import 'package:quotes/servises/youtube_api/youtube_api_endpoints.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  dynamic videoUIdList = [];
  dynamic thumbnailList = [];
  dynamic titleList = [];
  dynamic pageToken;
  dynamic length=5;
  final RefreshController controller = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarForHomeAndVideoTabBar()
            .returnAppBarForHomeAndSettings("Motivational Videos"),
        body: SmartRefresher(
          enablePullDown: false,
          enablePullUp: true,
          onLoading: _onLoading,
          controller: controller,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: titleList.length,
            itemBuilder: (context, index) {
              return thumbnailList.isEmpty||thumbnailList==null?Container():Container(
                margin: EdgeInsets.only(top: 23),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return VideoPlayerSeparatePage(
                          url: videoUIdList[index],
                        );
                      }));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            '${titleList[index]} -:',
                            style: TextStyle(color: Colors.black, fontSize: 23),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: Container(
                            height: 200,
                            child: CachedNetworkImage(
                              errorWidget: (a, b, c) {
                                return Center(
                                    child: Text(
                                  "Please check Internet Connection",
                                  style: TextStyle(fontSize: 24),
                                ));
                              },
                              imageUrl: thumbnailList[index],
                              fit: BoxFit.fill,
                              placeholder: (context, url) {
                                return SpinKitDoubleBounce(
                                  color: color,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            },
          ),
        ));
  }

  void addDataToList() async {
    dynamic data = await NetworkHelper(
            url: YouTubeApiClass().getListOfVideoUrlEndpoint("motivational"))
        .getResponse();

    for (int i = 0; i <= 5; i++) {
      videoUIdList.add(data['items'][i]['id']['videoId']);
      titleList.add(data['items'][i]['snippet']['title']);
      thumbnailList
          .add(data['items'][i]['snippet']['thumbnails']['medium']['url']);
    }
    setState(() {
      pageToken = data['nextPageToken'];
    });
  }

  _onLoading() async {
    dynamic data = await NetworkHelper(
            url: YouTubeApiClass().getNexPageVideoUrlEndpoint("motivational", pageToken)).getResponse();
    for (int i = 0; i <= 5; i++) {
      videoUIdList.add(data['items'][i]['id']['videoId']);
      titleList.add(data['items'][i]['snippet']['title']);
      thumbnailList
          .add(data['items'][i]['snippet']['thumbnails']['medium']['url']);
    }
    setState(() {
      pageToken = data['nextPageToken'];

    });
    controller.loadComplete();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addDataToList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
