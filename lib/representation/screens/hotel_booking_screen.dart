import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  static String routerName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Hotel booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
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
              onTap: () {
                print('object');
              },
            ),
            ItemBookingWidget(
              icon: SizedBox(
                width: 19.2,
                height: 19.2,
                child: Image.asset(
                  AssetHelper.iconCalendar,
                ),
              ),
              color: Color(0xffF77777),
              title: 'Select Date',
              subTitle: '13 Feb - 18 Feb 2021',
            ),
            ItemBookingWidget(
              icon: SizedBox(
                width: 23,
                height: 20,
                child: Image.asset(
                  AssetHelper.iconBed,
                ),
              ),
              color: Color(0xff3EC8BC),
              title: 'Guest and Room',
              subTitle: '2 Guest, 1 Room',
            ),
          ],
        ),
      ),
    );
  }
}
