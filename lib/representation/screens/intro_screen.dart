import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/core/constants/text_style_constants.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_travel_app/representation/screens/main_screen.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static String routerName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  String buttonTitle = 'Next';

  final StreamController<int> _pageStreamController =
      StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _builderItemIntroScreen(
      String image, String title, String desc, Alignment imageAlign) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: imageAlign,
          child: ImageHelper.loadFromAsset(
            image,
            height: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
            radius: const BorderRadius.all(Radius.zero),
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kMediumPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                desc,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _builderItemIntroScreen(
                AssetHelper.imageIntro1,
                'Book a flight',
                'Found a flight that matches your destination and schedule? Book it instantly.',
                Alignment.centerRight,
              ),
              _builderItemIntroScreen(
                AssetHelper.imageIntro2,
                'Find a hotel room',
                'Select the day, book your room. We give you the best price.',
                Alignment.center,
              ),
              _builderItemIntroScreen(
                AssetHelper.imageIntro3,
                'Enjoy your trip',
                'Easy discovering new places and share these between your friends and travel together.',
                Alignment.centerLeft,
              ),
            ],
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 2,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange,
                    ),
                  ),
                ),
                StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 3,
                        child: ButtonWidget(
                          title: snapshot.data == 2 ? 'Get started' : 'Next',
                          onTap: () {
                            if (snapshot.data != 2) {
                              _pageController.nextPage(
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 700));
                            } else {
                              Navigator.of(context)
                                  .pushNamed(MainScreen.routerName);
                              LocalStorageHelper.setValue(
                                  'ignoreIntroScreen', true);
                            }
                          },
                        ),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
