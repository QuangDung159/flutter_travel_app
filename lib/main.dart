// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_travel_app/representation/screens/splash_screen.dart';
import 'package:flutter_travel_app/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
      appBar: AppBar(
        title: Text('Flutter Travel'),
      ),
      body: Center(
        child: const Text(
          'Flutter Travel',
        ),
      ),
    );
  }
}
