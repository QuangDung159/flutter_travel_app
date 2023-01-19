import 'package:flutter/material.dart';
import 'package:flutter_travel_app/data/models/hotel_model.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/card_room_widget.dart';

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

    List<Widget> listCardRoom = [];

    for (var i = 0; i < listRoom.length; i++) {
      listCardRoom.add(
        CardRoomWidget(
          roomModel: listRoom[i],
          isShowChooseButton: true,
        ),
      );
    }

    return AppBarContainer(
      implementLeading: true,
      titleString: 'Select Room',
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: listCardRoom,
          ),
        ),
      ),
    );
  }
}
