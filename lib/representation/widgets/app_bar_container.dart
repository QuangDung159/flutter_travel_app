import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 190,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                  ),
                  Positioned(
                    child: ImageHelper.loadFromAsset(
                      AssetHelper.imageOval1,
                      height: 120,
                      fit: BoxFit.fitHeight,
                    ),
                    top: 0,
                    left: 0,
                  ),
                  Positioned(
                    child: ImageHelper.loadFromAsset(
                      AssetHelper.imageOval2,
                      height: 120,
                      fit: BoxFit.fitHeight,
                    ),
                    bottom: 0,
                    right: 0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 156,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
