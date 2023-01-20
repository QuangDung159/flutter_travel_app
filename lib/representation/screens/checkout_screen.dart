import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/screens/checkout_paymern_screen.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/card_checkout_info_widget.dart';
import 'package:flutter_travel_app/representation/widgets/card_room_widget.dart';
import 'package:flutter_travel_app/representation/widgets/checkout_process_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  static String routerName = '/checkout_screen';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    RoomModel roomModel =
        ModalRoute.of(context)?.settings.arguments as RoomModel;

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
                  CardRoomWidget(
                    roomModel: roomModel,
                  ),
                  CardCheckoutInfoWidget(
                    title: 'Contact Details',
                    subTitle: 'Add Contact',
                    icon: Container(
                      alignment: Alignment.center,
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff6155CC).withOpacity(0.2),
                      ),
                      child: ImageHelper.loadFromAsset(
                        AssetHelper.iconContact,
                        width: 19.2,
                        height: 16,
                      ),
                    ),
                  ),
                  CardCheckoutInfoWidget(
                    title: 'Promo Code',
                    subTitle: 'Add Promo Code',
                    icon: Container(
                      alignment: Alignment.center,
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffFE9C5E).withOpacity(0.2),
                      ),
                      child: ImageHelper.loadFromAsset(
                        AssetHelper.iconDiscount,
                        width: 19.2,
                        height: 19.2,
                      ),
                    ),
                  ),
                  ButtonWidget(
                    title: 'Payment',
                    onTap: () => Navigator.of(context).pushNamed(
                      CheckoutPaymentScreen.routerName,
                      arguments: roomModel,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          CheckoutProcessWidget()
        ],
      ),
    );
  }
}
