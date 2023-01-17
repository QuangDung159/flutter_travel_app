import 'package:flutter/material.dart';
import 'package:flutter_travel_app/representation/screens/all_screen.dart';
import 'package:flutter_travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:flutter_travel_app/representation/screens/hotel_screen.dart';
import 'package:flutter_travel_app/representation/screens/intro_screen.dart';
import 'package:flutter_travel_app/representation/screens/main_screen.dart';
import 'package:flutter_travel_app/representation/screens/plane_screen.dart';
import 'package:flutter_travel_app/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routerName: (context) => const SplashScreen(),
  IntroScreen.routerName: (context) => const IntroScreen(),
  MainScreen.routerName: (context) => const MainScreen(),
  HotelScreen.routerName: (context) => const HotelScreen(),
  PlanScreen.routerName: (context) => const PlanScreen(),
  AllScreen.routerName: (context) => const AllScreen(),
  HotelBookingScreen.routerName: (context) => const HotelBookingScreen(),
};
