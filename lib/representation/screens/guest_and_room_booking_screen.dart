import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/guest_and_booking_widget.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  const GuestAndRoomBookingScreen({super.key});

  static String routerName = '/guest_and_room_booking_screen';

  @override
  State<GuestAndRoomBookingScreen> createState() =>
      _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Add guest and room',
      implementLeading: true,
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 2,
          ),
          GuestAndBookingWidget(
            type: 'Guest',
            count: 1,
          ),
          GuestAndBookingWidget(
            type: 'Room',
            count: 2,
          ),
          ButtonWidget(
            title: 'Done',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
