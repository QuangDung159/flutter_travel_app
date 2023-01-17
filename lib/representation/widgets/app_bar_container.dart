import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
    required this.child,
    this.title,
    this.implementLeading = false,
    this.titleString,
  });

  final Widget child;
  final Widget? title;
  final bool implementLeading;
  final String? titleString;

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
              title: title ??
                  Row(
                    children: [
                      implementLeading
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  kDefaultPadding,
                                ),
                              ),
                              padding: EdgeInsets.all(kItemPadding),
                              child: Icon(
                                Icons.arrow_back,
                                size: kDefaultIconSize,
                                color: Colors.black,
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              titleString ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
