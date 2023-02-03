import 'package:flutter/material.dart';

class LoginMethodButtonWidget extends StatefulWidget {
  const LoginMethodButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.backgroundColor,
    required this.onTap,
  });

  final Widget icon;
  final Widget title;
  final Color backgroundColor;
  final Future<dynamic>? Function() onTap;

  @override
  State<LoginMethodButtonWidget> createState() =>
      _LoginMethodButtonWidgetState();
}

class _LoginMethodButtonWidgetState extends State<LoginMethodButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 155,
        height: 50,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            SizedBox(
              width: 15,
            ),
            widget.title
          ],
        ),
      ),
    );
  }
}
