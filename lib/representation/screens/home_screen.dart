import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/representation/screens/all_screen.dart';
import 'package:flutter_travel_app/representation/screens/hotel_screen.dart';
import 'package:flutter_travel_app/representation/screens/plane_screen.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _renderItemCategory(
      Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: kMediumPadding,
            ),
            child: icon,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding),
            ),
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Text(title),
        ],
      ),
    );
  }

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
                borderSide: BorderSide.none,
              ),
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
              Expanded(
                child: _renderItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.iconHotel,
                    width: kDefaultIconSize,
                    height: kDefaultIconSize,
                  ),
                  Color(0xffFE9C5E),
                  () => Navigator.of(context).pushNamed(HotelScreen.routerName),
                  'Hotel',
                ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _renderItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.iconPlane,
                    width: kDefaultIconSize,
                    height: kDefaultIconSize,
                  ),
                  Color(0xffF77777),
                  () => Navigator.of(context).pushNamed(PlanScreen.routerName),
                  'Plane',
                ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _renderItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.iconHotelPlane,
                    width: kDefaultIconSize,
                    height: kDefaultIconSize,
                  ),
                  Color(0xff3EC8BC),
                  () => Navigator.of(context).pushNamed(AllScreen.routerName),
                  'All',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
