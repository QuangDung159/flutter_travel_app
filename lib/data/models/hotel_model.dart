import 'package:flutter_travel_app/data/models/hotel_service_model.dart';

class HotelModel {
  final String hotelImage;
  final String hotelName;
  final String location;
  final String awayKilometer;
  final double star;
  final int numberOfReview;
  final int price;
  final String locationDesc;
  final String information;
  final List<HotelServiceModel>? listService;

  HotelModel({
    required this.hotelImage,
    required this.hotelName,
    required this.location,
    required this.awayKilometer,
    required this.star,
    required this.numberOfReview,
    required this.price,
    required this.locationDesc,
    required this.information,
    this.listService
  });
}
