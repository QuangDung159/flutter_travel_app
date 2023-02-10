import 'package:flutter/material.dart';
import 'package:flutter_travel_app/representation/screens/account_screen.dart';
import 'package:flutter_travel_app/representation/screens/booking_screen.dart';
import 'package:flutter_travel_app/representation/screens/checkout_confirm_screen.dart';
import 'package:flutter_travel_app/representation/screens/home_screen.dart';
import 'package:flutter_travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:flutter_travel_app/representation/screens/hotels_screen.dart';

class CommonHelper {
  static void showMyDialog({
    required BuildContext context,
    required List<Widget> actions,
    required Widget title,
    Widget? content,
    bool? barrierDismissible,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible:
          barrierDismissible != null ? barrierDismissible : false,
      builder: (context) {
        return AlertDialog(
          title: title,
          actions: actions,
          content: content,
        );
      },
    );
  }
}

void printCustom({String? title, content}) {
  if (title != null && title != '') {
    print('${title} ${content}');
  } else {
    print('${content}');
  }
}

Widget navigationByRouterName(String? routerName) {
  switch (routerName) {
    case '/hotel_booking_screen':
      return HotelBookingScreen();
    case '/hotels_screen':
      return HotelsScreen();
    case '/account_screen':
      return AccountScreen();
    case '/booking_screen':
      return BookingScreen();
    case '/checkout_confirm_screen':
      return CheckoutConfirmScreen();
    default:
      return HomeScreen();
  }
}
