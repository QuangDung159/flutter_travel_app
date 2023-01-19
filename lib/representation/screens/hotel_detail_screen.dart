import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';
import 'package:flutter_travel_app/data/models/hotel_service_model.dart';
import 'package:flutter_travel_app/representation/widgets/hotel_location_widget.dart';
import 'package:flutter_travel_app/representation/widgets/hotel_review_widget.dart';
import 'package:flutter_travel_app/representation/widgets/hotel_service_item_widget.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key});

  static String routerName = '/hotel_detail_screen';

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final HotelModel hotelModel =
        ModalRoute.of(context)!.settings.arguments as HotelModel;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.imageHotelDetail,
              fit: BoxFit.fill,
            ),
          ),
          renderBottomSheet(hotelModel),
          Positioned(
            left: kDefaultPadding,
            top: 60,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: kDefaultIconSize,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            right: kDefaultPadding,
            top: 60,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: ImageHelper.loadFromAsset(
                    AssetHelper.iconHeart,
                    width: 16,
                    height: 14,
                    tintColor: Color(0xffF5DCDC),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget renderBottomSheet(HotelModel hotelModel) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      maxChildSize: 0.8,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: kMediumPadding,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 12),
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.4),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    SizedBox(
                      height: 37,
                    ),
                    Row(
                      children: [
                        Text(
                          hotelModel.hotelName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$${hotelModel.price.toString()}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            '/night',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    HotelLocationWidget(
                      hotelModel: hotelModel,
                      isShowAway: true,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    ImageHelper.loadFromAsset(AssetHelper.imageDashLine),
                    SizedBox(
                      height: 14,
                    ),
                    HotelReviewWidget(
                      hotelModel: hotelModel,
                      isShowSeeAll: true,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    ImageHelper.loadFromAsset(AssetHelper.imageDashLine),
                    SizedBox(
                      height: 19,
                    ),
                    Text(
                      'Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      hotelModel.information,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HotelServiceItemWidget(
                          hotelServiceModel: new HotelServiceModel(
                            title: 'Restaurant',
                            backgroundColor: Color(0xff6150CF).withOpacity(0.2),
                            content: ImageHelper.loadFromAsset(
                              AssetHelper.iconRestaurant,
                              width: 19.2,
                              height: 19.2,
                            ),
                          ),
                        ),
                        HotelServiceItemWidget(
                          hotelServiceModel: new HotelServiceModel(
                            title: 'Wifi',
                            backgroundColor: Color(0xffFF9C57).withOpacity(0.2),
                            content: ImageHelper.loadFromAsset(
                              AssetHelper.iconWifi,
                              width: 22.4,
                              height: 19.2,
                            ),
                          ),
                        ),
                        HotelServiceItemWidget(
                          hotelServiceModel: new HotelServiceModel(
                            title: 'Currency Exchange',
                            backgroundColor: Color(0xffF97674).withOpacity(0.2),
                            content: ImageHelper.loadFromAsset(
                              AssetHelper.iconMoneyExchange,
                              width: 20,
                              height: 19.2,
                            ),
                          ),
                        ),
                        HotelServiceItemWidget(
                          hotelServiceModel: new HotelServiceModel(
                            title: '24-hour Front Desk',
                            backgroundColor: Color(0xff34C9BD).withOpacity(0.2),
                            content: ImageHelper.loadFromAsset(
                              AssetHelper.iconReception,
                              width: 19.2,
                              height: 19.2,
                            ),
                          ),
                        ),
                        HotelServiceItemWidget(
                          hotelServiceModel: new HotelServiceModel(
                            title: 'More',
                            backgroundColor: Color(0xf2D3143).withOpacity(0.2),
                            content: ImageHelper.loadFromAsset(
                              AssetHelper.iconMore,
                              width: 16.8,
                              height: 4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
