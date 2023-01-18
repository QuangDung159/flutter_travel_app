import 'package:flutter/material.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  static String routerName = '/select_date_screen';

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Select date',
      child: Container(
        child: Text('asd'),
      ),
    );
  }
}
