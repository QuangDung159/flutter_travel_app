import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
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
      child: Column(
        children: [
          ItemBookingWidget(
            icon: ImageHelper.loadFromAsset(
              AssetHelper.iconLocation,
              width: 12.8,
              height: 19.2,
            ),
            color: Color(0xffFE9C5E),
            title: 'Destination',
            subTitle: 'South Korea',
          ),
          ItemBookingWidget(
            icon: ImageHelper.loadFromAsset(
              AssetHelper.iconCalendar,
              width: 19.2,
              height: 19.2,
              fit: BoxFit.fitWidth
            ),
            color: Color(0xffF77777),
            title: 'Destination',
            subTitle: 'South Korea',
          ),
          ItemBookingWidget(
            icon: ImageHelper.loadFromAsset(
              AssetHelper.iconBed,
              width: 23,
              height: 20,
            ),
            color: Color(0xff3EC8BC),
            title: 'Destination',
            subTitle: 'South Korea',
          )
        ],
      ),
    );
  }
}
