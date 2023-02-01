import 'package:flutter_travel_app/data/models/user_model.dart';

class PhotoModel {
  final String? _id;
  final String? photoDesc;
  final String? photoName;
  final String? photoUrl;
  final String? photoThumbnailUrl;
  final UserModel? photoCreatedBy;
  final String? id;

  PhotoModel(
    this._id,
    this.photoDesc,
    this.photoName,
    this.photoUrl,
    this.photoThumbnailUrl,
    this.photoCreatedBy,
    this.id,
  );

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    {
      return PhotoModel(
        json['_id'],
        json['photo_desc'],
        json['photo_name'],
        json['photo_url'],
        json['photo_thumbnail_url'],
        UserModel.fromJson(json['photo_created_by']),
        json['id'],
      );
    }
  }
}
