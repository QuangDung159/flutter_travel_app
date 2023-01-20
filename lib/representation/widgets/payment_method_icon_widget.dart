import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/data/models/payment_method_model.dart';
import 'package:flutter_travel_app/representation/widgets/icon_background_widget.dart';

class PaymentMethodIconWidget extends StatelessWidget {
  const PaymentMethodIconWidget({
    super.key,
    required this.paymentMethod,
  });

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    return renderIconByType(paymentMethod.iconType);
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
}
