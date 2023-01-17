import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_travel_app/representation/screens/intro_screen.dart';
import 'package:flutter_travel_app/representation/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routerName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void redirectIntroScreen() async {
    final ignoreIntroScreen =
        LocalStorageHelper.getValue('ignoreIntroScreen') ?? false;

    await Future.delayed(
      const Duration(seconds: 2),
      () => {
        if (ignoreIntroScreen)
          {
            Navigator.of(context).pushNamed(
              MainScreen.routerName,
            ),
          }
        else
          {
            Navigator.of(context).pushNamed(
              IntroScreen.routerName,
            )
          }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageHelper.loadFromAsset(
          AssetHelper.imageBackgroundSplash,
          fit: BoxFit.fitHeight,
        ),
        ImageHelper.loadFromAsset(
          AssetHelper.imageCircleSplash,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
