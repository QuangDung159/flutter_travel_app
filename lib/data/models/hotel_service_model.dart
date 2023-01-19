import 'package:flutter/material.dart';

class HotelServiceModel {
  final String title;
  final Color backgroundColor;
  final Widget content;
  final Function()? onTap;

  HotelServiceModel({
    required this.title,
    required this.backgroundColor,
    required this.content,
    this.onTap,
  });
}
