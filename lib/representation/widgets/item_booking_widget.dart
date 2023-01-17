import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.subTitle,
  });

  final Widget icon;
  final Color color;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: kDefaultBorderRadius,
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12)),
                child: icon
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        )
      ],
    );
  }
}
