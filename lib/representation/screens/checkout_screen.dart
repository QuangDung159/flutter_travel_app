import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_travel_app/data/models/room_model.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

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
      child: Container(),
    );
  }
}
