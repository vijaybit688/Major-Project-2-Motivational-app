import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

Future<void> shareImageFromUrl(String url) async {
  try {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    //await Share.file('ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg');
  } catch (e) {
    print('error: $e');
  }
}