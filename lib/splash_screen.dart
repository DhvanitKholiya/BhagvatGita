import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isSplash', true);

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('logIn_Page');
    });
  }

  @override
  void initState() {
    super.initState();
    checkPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            FlutterLogo(
              size: 200,
            ),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
            Text(
              "Made in India❤️",
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
