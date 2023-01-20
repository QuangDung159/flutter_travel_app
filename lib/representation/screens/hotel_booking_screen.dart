import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/get_x_controller.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/extensions/date_ext.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:flutter_travel_app/representation/screens/hotels_screen.dart';
import 'package:flutter_travel_app/representation/screens/select_date_screen.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/item_booking_widget.dart';
import 'package:get/get.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  static String routerName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final getXController = Get.put(GetXController());
    final datetimeRangeSelected = getXController.datetimeRangeSelected;
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Hotel Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: containerPaddingWithAppBar + 25,
            ),
            ItemBookingWidget(
              icon: SizedBox(
                width: 12.8,
                height: 19.2,
                child: Image.asset(
                  AssetHelper.iconLocation,
                ),
              ),
              color: Color(0xffFE9C5E),
              title: 'Destination',
              subTitle: 'South Korea',
              onTap: () =>
                  Navigator.of(context).pushNamed(HotelsScreen.routerName),
            ),
            Obx(
              () => ItemBookingWidget(
                icon: SizedBox(
                  width: 19.2,
                  height: 19.2,
                  child: Image.asset(
                    AssetHelper.iconCalendar,
                  ),
                ),
                color: Color(0xffF77777),
                title: 'Select Date',
                subTitle:
                    '${datetimeRangeSelected[0].getStartDate} - ${datetimeRangeSelected[1].getEndDate}',
                onTap: () async {
                  Navigator.of(context).pushNamed(SelectDateScreen.routerName);
                },
              ),
            ),
            Obx(
              () => ItemBookingWidget(
                icon: SizedBox(
                  width: 23,
                  height: 20,
                  child: Image.asset(
                    AssetHelper.iconBed,
                  ),
                ),
                color: Color(0xff3EC8BC),
                title: 'Guest and Room',
                subTitle:
                    '${getXController.countGuest.value} Guest${getXController.countGuest.value > 1 ? 's' : ''}, ${getXController.countRoom.value} Room${getXController.countRoom.value > 1 ? 's' : ''}',
                onTap: () => Navigator.of(context).pushNamed(
                  GuestAndRoomBookingScreen.routerName,
                ),
              ),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ButtonWidget(
              title: 'Search',
              onTap: () => Navigator.of(context).pushNamed(
                HotelsScreen.routerName,
              ),
            )
          ],
        ),
      ),
    );
  }
}
