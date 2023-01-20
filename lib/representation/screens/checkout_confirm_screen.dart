import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
}
