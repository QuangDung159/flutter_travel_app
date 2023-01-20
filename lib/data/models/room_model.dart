import 'package:flutter_travel_app/data/models/hotel_service_model.dart';

class RoomModel {
  final String name;
  final String image;
  final double size;
  final bool isFreeCancellation;
  final List<HotelServiceModel>? listRoomService;
  final int price;
  final String? subTitle;

  RoomModel({
    required this.name,
    required this.image,
    required this.size,
    required this.isFreeCancellation,
    this.listRoomService,
    required this.price,
    this.subTitle,
  });
}
