import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/get_x_controller.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/guest_and_booking_widget.dart';
import 'package:get/get.dart';

class GuestAndRoomBookingScreen extends StatelessWidget {
  const GuestAndRoomBookingScreen({super.key});

  static String routerName = '/guest_and_room_booking_screen';

  @override
  Widget build(BuildContext context) {
    final getXController = Get.find<GetXController>();
    return AppBarContainer(
      titleString: 'Add guest and room',
      implementLeading: true,
      child: Column(
        children: [
          SizedBox(
            height: containerPaddingWithAppBar + 25,
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
            onTap: () => Get.back(),
          )
        ],
      ),
    );
  }
}
