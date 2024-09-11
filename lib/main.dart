import 'package:api_class/pages/img_details.dart';
import 'package:api_class/pages/splash_screen.dart';
import 'package:api_class/pages/wallpaper_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      getPages: [
        GetPage(name: "/home", page: ()=>WallpaperPage()),
        GetPage(name: "/details", page: ()=>ImageDetailPage()),
        GetPage(name: "/SplashScreen", page: ()=>SplashScreen())
      ],
    );
  }
}
