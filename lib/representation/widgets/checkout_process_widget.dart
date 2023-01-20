import 'package:flutter/material.dart';
import 'package:flutter_travel_app/data/models/checkout_step_model.dart';

class CheckoutProcessWidget extends StatelessWidget {
  const CheckoutProcessWidget({
    super.key,
    this.stepActive = 1,
  });

  final int stepActive;

  @override
  Widget build(BuildContext context) {
    List<CheckoutStepModel> listCheckoutStepModel = [
      new CheckoutStepModel(step: 1, stepName: 'Book and Review', isEnd: false),
      new CheckoutStepModel(step: 2, stepName: 'Payment', isEnd: false),
      new CheckoutStepModel(step: 3, stepName: 'Confirm', isEnd: true),
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
            stepItem.step, stepItem.stepName, stepItem.isEnd),
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

  Widget renderItemStepCheckout(int step, String stepName, bool isEnd) {
    bool isCheck = stepActive == step;
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
}
