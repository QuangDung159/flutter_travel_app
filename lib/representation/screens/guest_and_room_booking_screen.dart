import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

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
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.4),
                  decoration: BoxDecoration(
                    color: Color(0xffFE9C5E).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    width: 19.2,
                    height: 19.2,
                    child: Image.asset(AssetHelper.iconGuest),
                  ),
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Text('Guest'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
