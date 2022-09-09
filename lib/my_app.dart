

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_state_app_flutter/views/splash_screen.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}