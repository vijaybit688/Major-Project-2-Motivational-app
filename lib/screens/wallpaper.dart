import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:quotes/functions/app_bar_return_function.dart';
import 'package:quotes/functions/download.dart';
import 'package:quotes/functions/external_functions.dart';
import 'package:quotes/servises/networking/NetworkHelper.dart';
import 'package:quotes/servises/unsplash_api/unsplash_api_endpoints.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class WallPaper extends StatefulWidget {
  WallPaper({Key? key}) : super(key: key);
  @override
  _WallPaperState createState() => _WallPaperState();
}

class _WallPaperState extends State<WallPaper> {
  final RefreshController _controller = RefreshController();
  int apiPageValue = 1;
  dynamic listOfUrl = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForHomeAndVideoTabBar()
          .returnAppBarForHomeAndSettings("Wallpapers"),
      body: SmartRefresher(
        controller: _controller,
        enablePullUp: true,
        onLoading: _onLoading,
        child: ListView.builder(
            itemCount: listOfUrl.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CachedNetworkImage(
                      height: 600,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                      imageUrl: '${listOfUrl[index]}',
                      placeholder: (context, url) {
                        return SpinKitDoubleBounce(
                          color: Colors.pink,
                          size: 100,
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextButton(
                                onPressed: () {
                                  wallpaperSetter(
                                      listOfUrl![index],
                                      WallpaperManagerFlutter.HOME_SCREEN,
                                      context,
                                      "Wallpaper Applied To Home Screen");
                                },
                                child: Center(
                                    child: Text(
                                  "Home Screen",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ))),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextButton(
                              onPressed: () {
                                wallpaperSetter(
                                    listOfUrl![index],
                                    WallpaperManagerFlutter.LOCK_SCREEN,
                                    context,
                                    "Wallpaper Applied To Lock Screen");
                              },
                              child: Center(
                                child: Text(
                                  "Lock Screen",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(8)),
                            child: IconButton(
                              icon: Icon(Icons.download_outlined),
                              onPressed: () {
                                downloadImage(listOfUrl![index], context,
                                    "Image Downloaded in Gallery");
                              },
                            ),
                          ),
                        ]),
                  ),
                ],
              );
            }),
      ),
    );
  }
  Future<List> _addDataToList() async {
    var data =
        await NetworkHelper(url: UnsplashApiClass().getNexPagePhotos("wallpaper", apiPageValue))
            .getResponse();

    for (int i = 0; i < 10; i++) {
      listOfUrl.add(data['results'][i]['urls']['full']);
    }
    apiPageValue=apiPageValue+1;
    setState(() {

    });
    return listOfUrl;
  }
  _onLoading()async{
    var data =
        await NetworkHelper(url: UnsplashApiClass().getNexPagePhotos("wallpaper", apiPageValue))
        .getResponse();
    for (int i = 0; i < 10; i++) {
      listOfUrl.add(data['results'][i]['urls']['full']);
    }
    apiPageValue=apiPageValue+1;
    setState(() {

    });
    _controller.loadComplete();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addDataToList();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
