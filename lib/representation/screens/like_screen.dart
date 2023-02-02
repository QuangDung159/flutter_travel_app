import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Favorite Destination',
      child: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: containerPaddingWithAppBar + 25,
                ),
                Text(
                    'Sorry, this feature is under development. Please get back later. Thank you!')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
