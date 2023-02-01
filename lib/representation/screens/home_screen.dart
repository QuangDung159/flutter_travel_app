import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/core/services/photo_services.dart';
import 'package:flutter_travel_app/data/models/photo_model.dart';
import 'package:flutter_travel_app/representation/screens/all_screen.dart';
import 'package:flutter_travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:flutter_travel_app/representation/screens/plane_screen.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<PhotoModel>> listPhoto;

  @override
  void initState() {
    super.initState();
    listPhoto = PhotoServices.fetchListPhoto();
  }

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

  List<Widget> renderListImage(List<PhotoModel> listPhotoRender, context) {
    double imageWith = (MediaQuery.of(context).size.width - 50) / 2;

    List<PhotoModel> listLeft = [];
    List<PhotoModel> listRight = [];

    for (var i = 0; i < listPhotoRender.length; i++) {
      if (i % 2 == 0) {
        listLeft.add(listPhotoRender[i]);
      } else {
        listRight.add(listPhotoRender[i]);
      }
    }

    return [
      renderListImageColumn(listLeft, imageWith),
      renderListImageColumn(listRight, imageWith),
    ];
  }

  Widget renderListImageColumn(
    List<PhotoModel> listPhotoRender,
    double imageWith,
  ) {
    return Column(
      children: List.generate(
        listPhotoRender.length,
        (index) => renderImage(listPhotoRender[index], imageWith, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: Row(
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
                height: 15,
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: containerPaddingWithAppBar - 40,
            ),
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
                    () => Navigator.of(context)
                        .pushNamed(HotelBookingScreen.routerName),
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
                    () =>
                        Navigator.of(context).pushNamed(PlanScreen.routerName),
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
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Destinations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6155CC),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            FutureBuilder(
              future: listPhoto,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: renderListImage(data, context),
                  );
                } else {
                  if (snapshot.hasData) {
                    return const Center(
                      child: Text(
                        'Fail',
                      ),
                    );
                  }
                  return const Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget renderImage(PhotoModel photo, double imageWith, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              photo.photoUrl!,
              width: imageWith,
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Image.asset(
              AssetHelper.iconHeart,
              width: 18,
              height: 13.99,
              color: index / 2 == 0 ? Color(0xffF77777) : Colors.white,
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: imageWith - 24,
                  child: Text(
                    photo.photoName!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetHelper.iconStar,
                        width: 16,
                        height: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        index.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
