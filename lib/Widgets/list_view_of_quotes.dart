import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/functions/download.dart';
import 'package:quotes/functions/share.dart';
import 'package:quotes/functions/toast.dart';

import '../Constant/Constants.dart';
import 'CoustomButton.dart';

class ListOfImagesSendItemCountOnly extends StatelessWidget {
  ListOfImagesSendItemCountOnly(
      {Key? key,
      required this.listOfUrl,
      this.numberOfUrl,
      this.listOfStringQuotes})
      : super(key: key);

  final List<String> listOfUrl;
  final int? numberOfUrl;
  final List? listOfStringQuotes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: numberOfUrl!,
      controller: scrollController,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              child: CachedNetworkImage(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  errorWidget: (a,b,c){
                    return Center(child: Text("Please check Internet Connection",style: TextStyle(fontSize: 24),));
                  },
                  imageUrl: '${listOfUrl[index]}',
                  placeholder: (context, url) {
                    return SpinKitDoubleBounce(
                      color: color,
                      size: 100,
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextButton(
                  listOfUrl: listOfUrl,
                  index: index,
                  icon: Icon(
                    Icons.copy_rounded,
                    color: Colors.black,
                    size: 28,
                  ),
                  function: () {
                    Clipboard.setData(
                        new ClipboardData(text: listOfStringQuotes![index]));
                   toastMessage(context, "Text Copied");
                  },
                ),
                CustomTextButton(
                  listOfUrl: listOfUrl,
                  index: index,
                  icon:
                      Icon(Icons.file_download, color: Colors.black, size: 28),
                  function: () {
                    downloadImage(listOfUrl[index],context,"Image Downloaded in Gallery");
                  },
                ),
                CustomTextButton(
                  listOfUrl: listOfUrl,
                  index: index,
                  icon: Icon(Icons.share, color: Colors.black, size: 28),
                  function: () {
                    shareImageFromUrl(listOfUrl[index]);
                  },
                ),
              ],
            )
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 4 == 0
            ? Container(
                height: 0,
                margin: EdgeInsets.only(bottom: 10),
                child: Container())
            : Container();
      },
    );
  }
}
