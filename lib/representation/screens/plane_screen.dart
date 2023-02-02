import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  static String routerName = '/plane_screen';

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Plan Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: containerPaddingWithAppBar + 25,
                  ),
                  Text('Sorry, this feature is under development. Please get back later. Thank you!')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
