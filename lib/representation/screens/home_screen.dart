import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/data/models/destination_model.dart';
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
  List<DestinationModel> listDestination = [
    new DestinationModel(
      id: 1,
      name: 'Phú Yên',
      star: 4.9,
      isLike: false,
      imgUrl:
          'https://lh3.googleusercontent.com/pw/AL9nZEXLKaY-RLbm3Mp2dlo-UYxn_1aWoHSSXnaI8h9z5IWom8Qvuy3XY7pNlBaqcJKIEGP2xR0xz-azXg_NGm3WjC0bBV1krRZpOPTH5Myb-aRdtHV7JDnMPPaTQvchib1x0QTy20maeWcq7hHp4l0yxuJK=w2794-h1572-no?authuser=0',
    ),
    new DestinationModel(
      id: 2,
      name: 'Ninh Thuận',
      star: 4.9,
      isLike: false,
      imgUrl:
          'https://lh3.googleusercontent.com/pw/AL9nZEXX0uJq8hoI3qTktZObmjoLJlmFeHfDHoYPdkC3xcplHp4Yr_zeksenLUYYkIJ_JD-UJQ1eP6UjLXmM7GfQ9iKwaqljXYD-EKoNyhh2JC6ekn1IGJI1QorUpYrb8QjGGKKQSM02nLWEpNfFkQT_Iz33=w886-h1572-no?authuser=0',
    ),
    new DestinationModel(
      id: 3,
      name: 'Vĩnh Hy',
      star: 4.9,
      isLike: true,
      imgUrl:
          'https://lh3.googleusercontent.com/pw/AL9nZEU80JzjVMBSVfk478Ql7tEdaCY9XUE0RO11BvmfcJXU_qOOQgpCwGj5CsArf_MJ_QYZzqxm7HUL7YC8CiuF8peHSGh6RRyF0tCyfnPVyRp7oyIjcccbqydrUFIxIwP0ttT_6iU1Flf2Yi09JqQDsf5W=w2794-h1572-no?authuser=0',
    ),
    new DestinationModel(
      id: 4,
      name: 'Bình Tiên',
      star: 4.9,
      isLike: true,
      imgUrl:
          'https://lh3.googleusercontent.com/pw/AL9nZEXvo2AzqxA4geF5ybzQEyUPUksCFcPT_QOuaD5hT0gH9QV9De1ImaTa7WnwyyQlyZdkIHIydq3avbWbF058M-x9GagC4wDPgBTiaUncKTjeGBXH7-w2bxuQofHoh5HzfwH5iPE7aNXUp3VWrH936j9Y=w2794-h1572-no?authuser=0',
    ),
    new DestinationModel(
      id: 5,
      name: 'Đại Lãnh',
      star: 4.9,
      isLike: true,
      imgUrl:
          'https://lh3.googleusercontent.com/pw/AL9nZEVPBkt1dnB6__-jW5H7aQktBZAGzry1c58mTXadSQD1fdBJmQD6t0X_nLArSQ_yFO69nWwAtrhaWBDhnRGiCd_-8uM_GxxKP3Rt3hADFQ1IkHxQozNmbUWFfI_K8LwL03MLZsExey8NX9ivTYBYCLoM=w886-h1572-no?authuser=0',
    ),
  ];

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

  List<Widget> renderListImage(
      List<DestinationModel> listDestination, context) {
    double imageWith = (MediaQuery.of(context).size.width - 50) / 2;

    List<DestinationModel> listLeft = [];
    List<DestinationModel> listRight = [];

    for (var i = 0; i < listDestination.length; i++) {
      if (i % 2 == 0) {
        listLeft.add(listDestination[i]);
      } else {
        listRight.add(listDestination[i]);
      }
    }

    return [
      renderListImageColumn(listLeft, imageWith),
      renderListImageColumn(listRight, imageWith),
    ];
  }

  Widget renderListImageColumn(
    List<DestinationModel> listDestination,
    double imageWith,
  ) {
    return Column(
      children: List.generate(
        listDestination.length,
        (index) => renderImage(listDestination[index], imageWith),
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
      child: SingleChildScrollView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: renderListImage(listDestination, context),
            )
          ],
        ),
      ),
    );
  }

  Widget renderImage(DestinationModel destination, double imageWith) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              destination.imgUrl,
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
              color: destination.isLike ? Color(0xffF77777) : Colors.white,
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
                        destination.star.toString(),
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
