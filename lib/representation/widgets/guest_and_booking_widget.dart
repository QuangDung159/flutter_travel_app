import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';

class GuestAndBookingWidget extends StatefulWidget {
  const GuestAndBookingWidget({
    Key? key,
    required this.type,
    required this.count,
  }) : super(key: key);

  final String type;
  final int count;

  @override
  State<GuestAndBookingWidget> createState() => _GuestAndBookingWidgetState();
}

class _GuestAndBookingWidgetState extends State<GuestAndBookingWidget> {
  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xff3EC8BC),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      widget.count.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
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
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        )
      ],
    );
  }

  Expanded renderIconTitle() {
    if (widget.type == 'guest') {
      return Expanded(
        child: Row(
          children: [
            Container(
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
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Text(
              'Guest',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    return Expanded(
      child: Row(
        children: [
          Container(
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
          ),
          SizedBox(
            width: kDefaultPadding,
          ),
          Text(
            'Room',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
