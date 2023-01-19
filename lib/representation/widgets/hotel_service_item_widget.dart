import 'package:flutter/material.dart';
import 'package:flutter_travel_app/data/models/hotel_service_model.dart';

class HotelServiceItemWidget extends StatelessWidget {
  const HotelServiceItemWidget({
    Key? key,
    required this.hotelServiceModel,
  }) : super(key: key);

  final HotelServiceModel hotelServiceModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: hotelServiceModel.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 32,
            width: 32,
            child: hotelServiceModel.content,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${hotelServiceModel.title}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
