import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/get_x_controller.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:get/get.dart';

class GuestAndBookingWidget extends StatelessWidget {
  const GuestAndBookingWidget({
    Key? key,
    required this.type,
    required this.count,
  }) : super(key: key);

  final String type;
  final int count;

  @override
  Widget build(BuildContext context) {
    final getXController = Get.find<GetXController>();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              renderIconTitle(),
              renderCountPanel(getXController),
            ],
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        )
      ],
    );
  }

  Expanded renderCountPanel(GetXController getXController) {
    return Expanded(
      flex: 5,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (type == 'Guest') {
                getXController.decreaseGuest();
              } else {
                getXController.decreaseRoom();
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: count == 1 ? Color(0xffD9EDEB) : Color(0xff3EC8BC),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              if (type == 'Guest') {
                getXController.increaseGuest();
              } else {
                getXController.increaseRoom();
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xff3EC8BC),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded renderIconTitle() {
    return Expanded(
      flex: 6,
      child: Row(
        children: [
          renderIconByType(),
          SizedBox(
            width: kDefaultPadding,
          ),
          Text(
            type,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Container renderIconByType() {
    if (type == 'Guest') {
      return Container(
        padding: EdgeInsets.all(6.4),
        decoration: BoxDecoration(
          color: Color(0xffFE9C5E).withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          width: 19.2,
          height: 19.2,
          child: Image.asset(AssetHelper.iconGuest),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.8, vertical: 6.4),
      decoration: BoxDecoration(
        color: Color(0xffF77777).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 22.4,
        height: 19.2,
        child: Image.asset(AssetHelper.iconRoom),
      ),
    );
  }
}
