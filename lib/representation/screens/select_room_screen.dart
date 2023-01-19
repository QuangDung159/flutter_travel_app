import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';
import 'package:flutter_travel_app/data/models/hotel_service_model.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/hotel_service_item_widget.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({super.key});

  static String routerName = '/select_room_screen';

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  @override
  Widget build(BuildContext context) {
    HotelModel hotelModel =
        ModalRoute.of(context)?.settings.arguments as HotelModel;
    List<RoomModel> listRoom = hotelModel.listRoom ?? [];

    return AppBarContainer(
      implementLeading: true,
      titleString: 'Select Room',
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: renderCardRoom(listRoom[0]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column renderCardRoom(RoomModel roomModel) {
    List<HotelServiceModel> listRoomService = roomModel.listRoomService ?? [];
    List<Widget> list = [];
    for (var i = 0; i < listRoomService.length; i++) {
      list.add(HotelServiceItemWidget(hotelServiceModel: listRoomService[i]));
    }

    return Column(
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
        renderPrice(roomModel),
        SizedBox(
          height: 17.5,
        ),
      ],
    );
  }

  Widget renderPrice(RoomModel listRoom) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${listRoom.price.toString()}',
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
          child: ButtonWidget(
            title: 'Choose',
            onTap: () {},
          ),
        )
      ],
    );
  }

  Widget renderRoomInfo(RoomModel roomModel) {
    return Row(
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
