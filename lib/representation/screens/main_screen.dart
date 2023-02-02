import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/screens/booking_screen.dart';
import 'package:flutter_travel_app/representation/screens/home_screen.dart';
import 'package:flutter_travel_app/representation/screens/like_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static String routerName = '/main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          LikeScreen(),
          BookingScreen(),
          Container(color: Colors.yellow,),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
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
