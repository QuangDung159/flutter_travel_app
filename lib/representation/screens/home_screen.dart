import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi James',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.notifications,
              size: kDefaultIconSize,
            ),
            SizedBox(
              width: kMinPadding,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ImageHelper.loadFromAsset(AssetHelper.imageIntro2),
            )
          ],
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  Icons.search,
                  size: kDefaultIconSize,
                  color: Colors.black,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              contentPadding: EdgeInsets.symmetric(
                horizontal: kItemPadding,
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Column()
            ],
          )
        ],
      ),
    );
  }
}
