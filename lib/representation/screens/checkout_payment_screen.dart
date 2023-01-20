import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/get_x_controller.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/payment_method_model.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/screens/checkout_confirm_screen.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/card_checkout_info_widget.dart';
import 'package:flutter_travel_app/representation/widgets/checkout_process_widget.dart';
import 'package:flutter_travel_app/representation/widgets/icon_background_widget.dart';
import 'package:get/get.dart';

class CheckoutPaymentScreen extends StatefulWidget {
  const CheckoutPaymentScreen({super.key});

  static String routerName = '/checkout_payment_screen';

  @override
  State<CheckoutPaymentScreen> createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  int paymentMethodSelected = 1;
  GetXController getX = Get.find<GetXController>();

  @override
  Widget build(BuildContext context) {
    RoomModel roomModel =
        ModalRoute.of(context)?.settings.arguments as RoomModel;

    List<PaymentMethodModel> listPaymentMethod = [
      new PaymentMethodModel(
        title: 'Mini Market',
        id: 1,
        iconType: 'icon_mini_market',
      ),
      new PaymentMethodModel(
        title: 'Credit / Debit Card',
        id: 2,
        iconType: 'icon_credit_debit_card',
        addButtonTitle: 'Add Card',
      ),
      new PaymentMethodModel(
        title: 'Bank Transfer',
        id: 3,
        iconType: 'icon_bank_transfer',
      ),
      new PaymentMethodModel(
        title: 'E-Wallet',
        id: 4,
        iconType: 'icon_credit_debit_card',
      ),
    ];

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
                  renderListPaymentMethod(listPaymentMethod),
                  ButtonWidget(
                    title: 'Done',
                    onTap: () => Navigator.of(context).pushNamed(
                      CheckoutConfirmScreen.routerName,
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
          CheckoutProcessWidget(
            stepActive: 2,
          )
        ],
      ),
    );
  }

  Widget renderIconByType(String paymentType) {
    switch (paymentType) {
      case 'icon_mini_market':
        return IconBackgroundWidget(
          child: Image.asset(
            AssetHelper.iconMiniMarket,
            width: 12,
            height: 32,
          ),
          backgroundColor: Color(0xffFE9C5E).withOpacity(0.2),
        );
      case 'icon_credit_debit_card':
        return IconBackgroundWidget(
          child: Image.asset(
            AssetHelper.iconCreditDebitCard,
            width: 18,
            height: 32,
          ),
          backgroundColor: Color(0xffF77777).withOpacity(0.2),
        );
      case 'icon_bank_transfer':
        return IconBackgroundWidget(
          child: Image.asset(
            AssetHelper.iconBankTransfer,
            width: 18,
            height: 32,
          ),
          backgroundColor: Color(0xff3EC8BC).withOpacity(0.2),
        );
      default:
        return IconBackgroundWidget(
          child: Image.asset(
            AssetHelper.iconBankTransfer,
            width: 18,
            height: 32,
          ),
          backgroundColor: Color(0xff3EC8BC).withOpacity(0.2),
        );
    }
  }

  Widget renderListPaymentMethod(List<PaymentMethodModel> listPaymentMethod) {
    List<Widget> listRender = [];

    for (var i = 0; i < listPaymentMethod.length; i++) {
      PaymentMethodModel paymentItem = listPaymentMethod[i];
      listRender.add(
        CardCheckoutInfoWidget(
          isShowCheckbox: true,
          isChecked: true,
          title: paymentItem.title,
          addButtonTitle: paymentItem.addButtonTitle,
          icon: renderIconByType(paymentItem.iconType),
          paymentMethod: paymentItem,
          onCheck: () => getX.updatePaymentMethodSelected(
            paymentItem.id,
          ),
        ),
      );
    }

    return Column(
      children: listRender,
    );
  }
}
