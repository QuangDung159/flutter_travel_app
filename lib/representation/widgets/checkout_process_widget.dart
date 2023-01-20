import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/get_x_controller.dart';
import 'package:flutter_travel_app/data/models/checkout_step_model.dart';
import 'package:get/get.dart';

class CheckoutProcessWidget extends StatefulWidget {
  const CheckoutProcessWidget({super.key});

  @override
  State<CheckoutProcessWidget> createState() => _CheckoutProcessWidgetState();
}

class _CheckoutProcessWidgetState extends State<CheckoutProcessWidget> {
  GetXController getX = Get.find<GetXController>();

  @override
  Widget build(BuildContext context) {
    List<CheckoutStepModel> listCheckoutStepModel = [
      new CheckoutStepModel(
          step: 1, stepName: 'Book and Review', isCheck: true, isEnd: false),
      new CheckoutStepModel(
          step: 2, stepName: 'Payment', isCheck: false, isEnd: false),
      new CheckoutStepModel(
          step: 3, stepName: 'Confirm', isCheck: false, isEnd: true),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: renderCheckoutProcess(listCheckoutStepModel),
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

  Widget renderItemStepCheckout(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: getX.checkoutStepActive == step ? Colors.white : Colors.white.withOpacity(0.2),
              ),
              child: Text(
                step.toString(),
                style: TextStyle(
                  color: getX.checkoutStepActive == step ? Colors.black : Colors.white,
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
                fontWeight: getX.checkoutStepActive == step ? FontWeight.w500 : FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
