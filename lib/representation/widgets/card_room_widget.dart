import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/get_x_controller.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/hotel_service_model.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/screens/checkout_screen.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/hotel_service_item_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CardRoomWidget extends StatelessWidget {
  const CardRoomWidget({
    super.key,
    required this.roomModel,
    this.isShowChooseButton = false,
  });

  final RoomModel roomModel;
  final bool? isShowChooseButton;

  @override
  Widget build(BuildContext context) {
    return renderCardRoom(roomModel, context);
  }

  Widget renderCardRoom(RoomModel roomModel, context) {
    List<HotelServiceModel> listRoomService = roomModel.listRoomService ?? [];
    List<Widget> list = [];
    for (var i = 0; i < listRoomService.length; i++) {
      list.add(
        HotelServiceItemWidget(hotelServiceModel: listRoomService[i]),
      );
    }

    return Container(
      padding: EdgeInsets.only(left: 20, top: 15, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          renderRoomInfo(roomModel),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list,
          ),
          SizedBox(
            height: 15,
          ),
          ImageHelper.loadFromAsset(AssetHelper.imageDashLine),
          SizedBox(
            height: 15,
          ),
          renderPrice(roomModel, context),
          SizedBox(
            height: 17.5,
          ),
        ],
      ),
    );
  }

  Widget renderPrice(RoomModel roomModel, context) {
    final GetXController getXController = Get.find<GetXController>();
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${roomModel.price.toString()}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '/night',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: isShowChooseButton!
              ? ButtonWidget(
                  title: 'Choose',
                  onTap: () => Navigator.of(context).pushNamed(
                      CheckoutScreen.routerName,
                      arguments: roomModel),
                )
              : Obx(
                  () => Text(
                    '${getXController.countRoom.value} room',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
        )
      ],
    );
  }

  Widget renderRoomInfo(RoomModel roomModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roomModel.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Room Size: ${roomModel.size} m2'),
            SizedBox(
              height: 10,
            ),
            Text(
              '${roomModel.isFreeCancellation ? 'Free Cancellation' : 'Paid cancellation'}',
            ),
          ],
        ),
        Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            roomModel.image,
            width: 60,
          ),
        ),
      ],
    );
  }
}
