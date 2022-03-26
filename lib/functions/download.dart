import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:quotes/functions/toast.dart';

void downloadImage(String url, BuildContext context, String message) async {
  try {
    // Saved with this method.
    var imageId = await ImageDownloader.downloadImage(url);

    if (imageId == null) {
      return;
    }
    toastMessage(context, message);

    // Below is a method of obtaining saved image information.
    // var fileName = await ImageDownloader.findName(imageId);
    // var path = await ImageDownloader.findPath(imageId);
    // var size = await ImageDownloader.findByteSize(imageId);
    // var mimeType = await ImageDownloader.findMimeType(imageId);
  } on PlatformException catch (error) {
    print(error);
  }
}