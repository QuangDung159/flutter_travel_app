import 'package:flutter/material.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';

class ItemHotelWidget extends StatelessWidget {
  ItemHotelWidget({super.key, required this.hotelModel});

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
    );
  }
}
