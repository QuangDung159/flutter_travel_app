import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';
import 'package:flutter_travel_app/data/models/hotel_service_model.dart';
import 'package:flutter_travel_app/representation/screens/select_room_screen.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/hotel_location_widget.dart';
import 'package:flutter_travel_app/representation/widgets/hotel_review_widget.dart';
import 'package:flutter_travel_app/representation/widgets/hotel_service_item_widget.dart';
import 'package:flutter_travel_app/representation/widgets/icon_background_widget.dart';

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
            top: 80,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: IconBackgroundWidget(
                child: Icon(
                  Icons.arrow_back,
                  size: kDefaultIconSize,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: kDefaultPadding,
            top: 80,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: IconBackgroundWidget(
                child: Image.asset(
                  AssetHelper.iconHeart,
                  width: 16,
                  height: 14,
                  color: Color(0xffF5DCDC),
                ),
                backgroundColor: Colors.white,
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
                    renderHotelListService(hotelModel),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      hotelModel.locationDesc,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    ImageHelper.loadFromAsset(AssetHelper.imageMap),
                    SizedBox(
                      height: 14,
                    ),
                    ButtonWidget(
                      title: 'Select Room',
                      onTap: () => Navigator.of(context).pushNamed(
                        SelectRoomScreen.routerName,
                        arguments: hotelModel,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row renderHotelListService(HotelModel hotelModel) {
    List<HotelServiceModel> listService = hotelModel.listService ?? [];

    List<Widget> list = [];
    // if greater than 5 item ==> render 4 and more
    // if has less and equal than 5 item => render 1 -> 5
    if (listService.length > 5) {
      for (var i = 0; i < 4; i++) {
        HotelServiceModel hotelService = listService[i];
        list.add(
          HotelServiceItemWidget(
            hotelServiceModel: new HotelServiceModel(
              title: '${hotelService.title}',
              backgroundColor: hotelService.backgroundColor,
              content: hotelService.content,
            ),
          ),
        );
      }
      list.add(
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
      );
    } else {
      for (var i = 0; i < listService.length; i++) {
        HotelServiceModel hotelService = listService[i];
        list.add(
          HotelServiceItemWidget(
            hotelServiceModel: new HotelServiceModel(
              title: '${hotelService.title}',
              backgroundColor: hotelService.backgroundColor,
              content: hotelService.content,
            ),
          ),
        );
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }
}
