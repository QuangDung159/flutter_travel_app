import 'package:flutter/material.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({super.key});

  static String routerName = '/select_room_screen';

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Select Room',
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('sdasd'),
                        Text('sdasd'),
                        Text('sdasd'),
                      ],
                    ),
                    // Image.network(''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}