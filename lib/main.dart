// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_travel_app/representation/screens/splash_screen.dart';
import 'package:flutter_travel_app/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorage();
  // LocalStorageHelper.setValue('ignoreIntroScreen', false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: const Text(
          'Flutter Travel',
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        margin: EdgeInsets.symmetric(
          horizontal: kMediumPadding,
          vertical: kDefaultPadding,
        ),
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              Icons.house,
              size: kDefaultIconSize,
            ),
            title: Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.heart_broken,
              size: kDefaultIconSize,
            ),
            title: Text('Like'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.work,
              size: kDefaultIconSize,
            ),
            title: Text('Booking'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.account_box,
              size: kDefaultIconSize,
            ),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
