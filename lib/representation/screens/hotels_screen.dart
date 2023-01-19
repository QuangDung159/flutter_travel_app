import 'package:flutter/material.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  static String routerName = '/hotels_screen';

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      implementTrailing: true,
      titleString: 'Hotels',
      child: Container(),
    );
  }
}
