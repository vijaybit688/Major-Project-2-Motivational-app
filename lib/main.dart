import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes/screens/test.dart';
import 'package:quotes/screens/videos_category.dart';
import 'package:quotes/screens/wallpaper.dart';

String playlistId = "PLd4rjD_RVZHGSPSEKNxf5bQbX4iuEkEey";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: VideoScreen());
  }
}

// class Splash extends StatefulWidget {
//   @override
//   _SplashState createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreen(
//         seconds: 3,
//         navigateAfterSeconds: MyApp(),
//         title: Text(
//           'Welcome',
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 45.0),
//         ),
//         backgroundColor: Color(0xFF8CD8E1),
//         loaderColor: Colors.red,
//       ),
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   @override
//   _PageState createState() => _PageState();
// }
//
// class _PageState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           bottomNavigationBar: ExpandingBottomBar(
//             navBarHeight: 70,
//             items: [
//               ExpandingBottomBarItem(
//                   icon: Icons.home, text: "Home", selectedColor: Colors.black),
//               ExpandingBottomBarItem(
//                   icon: Icons.ondemand_video_sharp,
//                   text: "Videos",
//                   selectedColor: Colors.black),
//               ExpandingBottomBarItem(
//                   icon: Icons.wallpaper,
//                   text: "wallpapers",
//                   selectedColor: Colors.black),
//               ExpandingBottomBarItem(
//                   icon: Icons.settings,
//                   text: "Settings",
//                   selectedColor: Colors.black),
//
//             ],
//             onIndexChanged: navigationBarFunction,
//             selectedIndex: pageIndex,
//           ),
//           body: PageView(
//             controller: pageController,
//             onPageChanged: pageViewFunction,
//             children: [CategoryPage(), Videos(), ListOfWallpaper(),Settings()],
//           )),
//     );
//   }
//
//   void navigationBarFunction(int value) {
//     pageController.animateToPage(value,
//         duration: const Duration(milliseconds: 300), curve: Curves.ease);
//   }
//
//   void pageViewFunction(int index) {
//     setState(() {
//       pageIndex = index;
//     });
//   }
//
// }
//
//
//
