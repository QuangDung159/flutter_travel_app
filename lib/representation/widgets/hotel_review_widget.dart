import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';

class HotelReviewWidget extends StatelessWidget {
  const HotelReviewWidget({
    Key? key,
    required this.hotelModel,
    this.isShowSeeAll = false,
  }) : super(key: key);

  final HotelModel hotelModel;
  final bool? isShowSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageHelper.loadFromAsset(
          AssetHelper.iconStar,
          width: 16,
          height: 16,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '${hotelModel.star.toString()} / 5',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          ' (${hotelModel.numberOfReview} reviews)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xffA5A5A7),
          ),
        ),
        Spacer(),
        if (isShowSeeAll!)
          GestureDetector(
            onTap: () {},
            child: Text(
              'See All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff6155CC),
              ),
            ),
          ),
      ],
    );
  }
}
