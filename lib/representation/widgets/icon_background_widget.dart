import 'package:flutter/material.dart';

class IconBackgroundWidget extends StatelessWidget {
  const IconBackgroundWidget({
    Key? key,
    required this.child,
    required this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
