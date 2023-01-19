import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';
import 'package:flutter_travel_app/data/models/hotel_service_model.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/item_hotel_widget.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  static String routerName = '/hotels_screen';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  final HotelModel dummy = new HotelModel(
    hotelImage: 'https://picsum.photos/250?image=1',
    hotelName: 'Grand Luxury’s',
    location: 'Seoul, South Korea',
    awayKilometer: '2',
    star: 3.4,
    numberOfReview: 1,
    price: 123,
    locationDesc:
        'Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.',
    information:
        'You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.',
    listService: [
      new HotelServiceModel(
        title: 'Restaurant',
        backgroundColor: Color(0xff6150CF).withOpacity(0.2),
        content: ImageHelper.loadFromAsset(
          AssetHelper.iconRestaurant,
          width: 19.2,
          height: 19.2,
        ),
      ),
      new HotelServiceModel(
        title: 'Wifi',
        backgroundColor: Color(0xffFF9C57).withOpacity(0.2),
        content: ImageHelper.loadFromAsset(
          AssetHelper.iconWifi,
          width: 22.4,
          height: 19.2,
        ),
      ),
      new HotelServiceModel(
        title: 'Currency Exchange',
        backgroundColor: Color(0xffF97674).withOpacity(0.2),
        content: ImageHelper.loadFromAsset(
          AssetHelper.iconMoneyExchange,
          width: 20,
          height: 19.2,
        ),
      ),
      new HotelServiceModel(
        title: '24-hour Front Desk',
        backgroundColor: Color(0xff34C9BD).withOpacity(0.2),
        content: ImageHelper.loadFromAsset(
          AssetHelper.iconReception,
          width: 19.2,
          height: 19.2,
        ),
      ),
      new HotelServiceModel(
        title: '24-hour Front Desk',
        backgroundColor: Color(0xff34C9BD).withOpacity(0.2),
        content: ImageHelper.loadFromAsset(
          AssetHelper.iconReception,
          width: 19.2,
          height: 19.2,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      implementTrailing: true,
      titleString: 'Hotels',
      child: SingleChildScrollView(
        child: Column(
          children: [
            ItemHotelWidget(
              hotelModel: dummy,
            ),
            ItemHotelWidget(
              hotelModel: dummy,
            ),
            ItemHotelWidget(
              hotelModel: dummy,
            ),
          ],
        ),
      ),
    );
  }
}
