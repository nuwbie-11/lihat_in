import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lihat_in/myApp.dart';
import 'package:lihat_in/view/CameraApps.dart';
import 'package:lihat_in/view/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool started = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<void> _setPref() async {
    // This Method is used to start Splash Screen Once
    final SharedPreferences prefs = await _prefs ;


    await prefs.setBool('started', started);
  }


  @override
  void initState() {
    // TODO: implement initState
    _setPref();
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Icons.home, 
      nextScreen: const MyApp(),
      duration: 3000 ,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,);
  }
}