
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/Constant/Constants.dart';
import 'package:quotes/Widgets/icons.dart';
import 'package:quotes/functions/toast.dart';
import 'package:quotes/screens/videos_category.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

import 'app_bar_return_function.dart';


Column returnRowForCategory(
    BuildContext context, String title, String namedPushRoutName, String url) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, namedPushRoutName);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: Stack(
            children:[ CachedNetworkImage(
              height:MediaQuery.of(context).size.width/2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imageUrl: url,
              placeholder: (context, url) {
                return SpinKitDoubleBounce(
                  color: color,
                  size: 100,
                );
              },
            ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(child: Text("Click Here",style:TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
      ),
    ],
  );
}





wallpaperSetter(
    String url, int location, BuildContext context, String message) async {
  // Image url

  final cachedimage =
      await DefaultCacheManager().getSingleFile(url); //image file
  //Choose screen type
  try {
    WallpaperManagerFlutter().setwallpaperfromFile(cachedimage, location);
    toastMessage(context, message);
  } catch (e) {
    toastMessage(context, "Please Check Internet Connection");
    print(e);
  } // Wrap with try catch for error management.
}

ScrollController scrollControllerForLoadingMoreData = ScrollController();
class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarForHomeAndVideoTabBar()
          .returnAppBarForHomeAndSettings("Motivational Videos"),
      body: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 8,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    if (index <=6) {
                      return Scaffold(
                        appBar: AppBarForAll().returnAppBar(
                            context: context,
                            icon: icon,
                            title: "Motivational Video"),
                        body: VideoScreen()
                      );
                    } else {
                      return Scaffold(
                        appBar: AppBarForAll().returnAppBar(
                          context: context,
                          icon: icon,
                          title: "Motivational Videos",
                        ),
                        body: Center(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Coming Soon Keep The App Up to Date ...",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(34),
                child: GridTile(
                  footer: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'happy',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  child: CachedNetworkImage(
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                    imageUrl:
                    'https://i.ytimg.com/vi/lPKCOmZXoxc/default.jpg',
                    placeholder: (context, index) {
                      return SpinKitDoubleBounce(
                        color:color,
                        size: 50,
                      );
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}


