import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';

class HotelLocationWidget extends StatelessWidget {
  const HotelLocationWidget({
    Key? key,
    required this.hotelModel,
    this.isShowAway = false,
  }) : super(key: key);

  final HotelModel hotelModel;
  final bool? isShowAway;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageHelper.loadFromAsset(
          AssetHelper.iconLocationHotel,
          height: 16,
          width: 11.96,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '${hotelModel.location}',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        if (isShowAway!)
          Text(
            ' - ${hotelModel.awayKilometer} km from destination',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff838383),
            ),
          ),
      ],
    );
  }
}
