import 'package:json_annotation/json_annotation.dart';

part "get_in_category.g.dart";

@JsonSerializable()
class GetInCategoryResponseModel {
  int? status;
  bool success;
  String? statusMessage;
  String message;
  List<GetInCategoryData>? data;

  GetInCategoryResponseModel({
    this.status,
    required this.success,
    this.statusMessage,
    required this.message,
    this.data,
  });

  factory GetInCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetInCategoryResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetInCategoryResponseModelToJson(this);
}

@JsonSerializable()
class GetInCategoryData {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Map<String, dynamic>? rating;

  GetInCategoryData({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory GetInCategoryData.fromJson(Map<String, dynamic> json) =>
      _$GetInCategoryDataFromJson(json);
  Map<String, dynamic> toJson() => _$GetInCategoryDataToJson(this);
}
