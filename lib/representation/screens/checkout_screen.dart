import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/checkout_step_model.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:flutter_travel_app/representation/widgets/card_checkout_info_widget.dart';
import 'package:flutter_travel_app/representation/widgets/card_room_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  static String routerName = '/checkout_screen';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Widget renderItemStepCheckout(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.2),
          ),
          child: Text(
            step.toString(),
            style: TextStyle(
              color: isCheck ? Colors.black : Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          stepName,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isCheck ? FontWeight.w500 : FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  List<Widget> renderCheckoutProcess(
    List<CheckoutStepModel> listCheckoutStepModel,
  ) {
    List<Widget> listStepRender = [];

    for (var i = 0; i < listCheckoutStepModel.length; i++) {
      CheckoutStepModel stepItem = listCheckoutStepModel[i];
      listStepRender.add(
        renderItemStepCheckout(
            stepItem.step, stepItem.stepName, stepItem.isEnd, stepItem.isCheck),
      );
      if (!stepItem.isEnd) {
        listStepRender.add(
          SizedBox(
            width: 16,
            child: Divider(
              color: Colors.white,
              height: 1,
              thickness: 1,
            ),
          ),
        );
      }
    }

    return listStepRender;
  }

  @override
  Widget build(BuildContext context) {
    RoomModel roomModel =
        ModalRoute.of(context)?.settings.arguments as RoomModel;

    List<CheckoutStepModel> listCheckoutStepModel = [
      new CheckoutStepModel(
          step: 1, stepName: 'Book and Review', isCheck: true, isEnd: false),
      new CheckoutStepModel(
          step: 2, stepName: 'Payment', isCheck: false, isEnd: false),
      new CheckoutStepModel(
          step: 3, stepName: 'Confirm', isCheck: false, isEnd: true),
    ];

    return AppBarContainer(
      implementLeading: true,
      titleString: 'Checkout',
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: renderCheckoutProcess(listCheckoutStepModel),
            ),
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
            ButtonWidget(title: 'Payment'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
