import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';

class ItemHotelWidget extends StatelessWidget {
  ItemHotelWidget({super.key, required this.hotelModel});

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(bottom: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    hotelModel.hotelImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              renderHotelInfo()
            ],
          ),
        ),
        Positioned(
          right: 30,
          top: 10,
          child: ImageHelper.loadFromAsset(
            AssetHelper.iconHeart,
            height: 16,
            width: 13.99,
            // tintColor: Colors.white
          ),
        ),
      ],
    );
  }

  Container renderHotelInfo() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotelModel.hotelName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
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
                '${hotelModel.location} - ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${hotelModel.awayKilometer} km from destination',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff838383),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
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
                hotelModel.star.toString(),
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
            ],
          ),
          SizedBox(
            height: 14.5,
          ),
          ImageHelper.loadFromAsset(AssetHelper.imageDashLine)
        ],
      ),
    );
  }
}
