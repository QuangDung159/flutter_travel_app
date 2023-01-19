import 'package:flutter/material.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';
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
    hotelName: 'hotelName',
    location: 'location',
    awayKilometer: '2',
    star: 3.4,
    numberOfReview: 1,
    price: 123,
    locationDesc:
        'Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.',
    information:
        'You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.',
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
