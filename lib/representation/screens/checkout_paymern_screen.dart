import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/card_checkout_info_widget.dart';
import 'package:flutter_travel_app/representation/widgets/checkout_process_widget.dart';

class CheckoutPaymentScreen extends StatefulWidget {
  const CheckoutPaymentScreen({super.key});

  static String routerName = '/checkout_payment_screen';

  @override
  State<CheckoutPaymentScreen> createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  int paymentMethodSelected = 1;

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
                  CardCheckoutInfoWidget(
                    isShowCheckbox: true,
                    isChecked: true,
                    title: 'Mini Market',
                    icon: Container(
                      alignment: Alignment.center,
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffFE9C5E).withOpacity(0.2),
                      ),
                      child: ImageHelper.loadFromAsset(
                        AssetHelper.iconMiniMarket,
                        width: 12,
                        height: 32,
                      ),
                    ),
                  ),
                  CardCheckoutInfoWidget(
                    isShowCheckbox: true,
                    isChecked: true,
                    title: 'Credit / Debit Card',
                    addButtonTitle: 'Add Card',
                    icon: Container(
                      alignment: Alignment.center,
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffF77777).withOpacity(0.2),
                      ),
                      child: ImageHelper.loadFromAsset(
                        AssetHelper.iconCreditDebitCard,
                        width: 18,
                        height: 32,
                      ),
                    ),
                  ),
                  CardCheckoutInfoWidget(
                    isShowCheckbox: true,
                    isChecked: true,
                    title: 'Bank Transfer',
                    icon: Container(
                      alignment: Alignment.center,
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff3EC8BC).withOpacity(0.2),
                      ),
                      child: ImageHelper.loadFromAsset(
                        AssetHelper.iconBankTransfer,
                        width: 18,
                        height: 32
                      ),
                    ),
                  ),
                  ButtonWidget(
                    title: 'Done',
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
}
