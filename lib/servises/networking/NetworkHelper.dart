import 'dart:convert';

import 'package:http/http.dart' as http;


class NetworkHelper {
  NetworkHelper({required this.url});

final String url;

  Future getResponse() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String source = response.body;
      dynamic a= json.decode(source);
     //print(a['results'][0]['urls']['full']);
      //print(a);
      return a;
    } else {
      print(response.statusCode);
    }
  }
}
