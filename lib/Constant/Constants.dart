
//import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
//final nativeAdController = NativeAdController();

int pageIndex = 0;
PageController pageController = PageController();
const color = Color(0xFF76D0E8);

// Widget playerForCloser(String url, bool autoPlay) {
//   return Container(
//     margin: EdgeInsets.all(10),
//     child: YoutubePlayer(
//         controller: YoutubePlayerController(
//       initialVideoId: url,
//       flags: YoutubePlayerFlags(isLive: false, autoPlay: autoPlay),
//     )),
//   );
// }



ScrollController scrollController = ScrollController();
void scrollToTop() {
  scrollController.jumpTo(scrollController.position.minScrollExtent);
}

ScrollController scrollController2 = ScrollController();
void scrollToTop2() {
  scrollController2.jumpTo(scrollController2.position.minScrollExtent);
}

ScrollController scrollController3 = ScrollController();
void scrollToTop3() {
  scrollController3.jumpTo(scrollController3.position.minScrollExtent);
}

ScrollController scrollController4 = ScrollController();
void scrollToTop4() {
  scrollController4.jumpTo(scrollController4.position.minScrollExtent);
}


