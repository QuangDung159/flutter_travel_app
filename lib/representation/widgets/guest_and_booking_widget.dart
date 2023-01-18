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
  int _count = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _count = widget.count;
    });
  }

  void increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  void decreaseCount() {
    if (_count > 1) {
      setState(() {
        _count -= 1;
      });
    }
  }

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
            children: [renderIconTitle(), renderCountPanel()],
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        )
      ],
    );
  }

  Expanded renderCountPanel() {
    return Expanded(
      flex: 5,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => decreaseCount(),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _count == 1 ? Color(0xffD9EDEB) : Color(0xff3EC8BC),
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
            _count.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => increaseCount(),
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
    if (widget.type == 'Guest') {
      return Expanded(
        flex: 6,
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
              widget.type,
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
      flex: 6,
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
            widget.type,
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
