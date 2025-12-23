import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_test/view/intro_page.dart';
import 'package:track_test/view/login_page.dart';
import 'package:track_test/view/splash_video_page.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    late VideoPlayerController _controller;

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: LoginPage(),
      // home: IntroPage(),
      home: SplashVideoPage(),
    );
  }
}
