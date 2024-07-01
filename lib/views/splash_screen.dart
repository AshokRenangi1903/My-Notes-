import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_hive/views/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (_) => Home()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "lib/resources/notes splash screen.png",
          height: Get.height * 0.8,
        ),
      ),
    );
  }
}
