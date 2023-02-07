import 'package:flutter/material.dart';
import 'package:flutter_travel_app/representation/screens/home_screen.dart';
import 'package:flutter_travel_app/representation/screens/hotel_booking_screen.dart';

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
    default:
      return HomeScreen();
  }
}
