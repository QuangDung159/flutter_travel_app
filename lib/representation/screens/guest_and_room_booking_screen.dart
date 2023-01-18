import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/get_x_controller.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/guest_and_booking_widget.dart';
import 'package:get/get.dart';

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
    final getXController = Get.put(GetXController());
    return AppBarContainer(
      titleString: 'Add guest and room',
      implementLeading: true,
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 2,
          ),
          Obx(
            () => GuestAndBookingWidget(
              type: 'Guest',
              count: getXController.countGuest.value,
            ),
          ),
          Obx(
            () => GuestAndBookingWidget(
              type: 'Room',
              count: getXController.countRoom.value,
            ),
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
