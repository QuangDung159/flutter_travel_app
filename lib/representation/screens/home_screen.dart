import 'package:flutter/material.dart';
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
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}
