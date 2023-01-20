import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/checkout_process_widget.dart';

class CheckoutConfirmScreen extends StatefulWidget {
  const CheckoutConfirmScreen({super.key});

  static String routerName = '/checkout_confirm_screen';

  @override
  State<CheckoutConfirmScreen> createState() => _CheckoutConfirmScreenState();
}

class _CheckoutConfirmScreenState extends State<CheckoutConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    RoomModel room = ModalRoute.of(context)?.settings.arguments as RoomModel;

    return AppBarContainer(
      implementLeading: true,
      titleString: 'Checkout',
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 45),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        renderRoomInfo(room),
                        Image.asset(
                          AssetHelper.iconBed,
                          color: Color(0xffFE9C5E),
                          width: 20,
                          height: 16,
                        )
                      ],
                    ),
                  ),
                  ButtonWidget(
                    title: 'Pay Now',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          CheckoutProcessWidget(
            stepActive: 2,
          )
        ],
      ),
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
