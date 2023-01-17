import 'package:flutter/material.dart';
import 'package:flutter_travel_app/representation/screens/intro_screen.dart';
import 'package:flutter_travel_app/representation/screens/main_screen.dart';
import 'package:flutter_travel_app/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routerName: (context) => const SplashScreen(),
  IntroScreen.routerName: (context) => const IntroScreen(),
  MainScreen.routerName: (context) => const MainScreen(),
};
