import 'package:json_annotation/json_annotation.dart';

part 'in_category_response_model.g.dart';

@JsonSerializable()
class InCategoryResponseModel {
  InCategoryResponseModel({required data});
  List<InCategoryResponseData>? data;

  factory InCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InCategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$InCategoryResponseModelToJson(this);
}

@JsonSerializable()
class InCategoryResponseData {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  Map<String, dynamic>? rating;

  InCategoryResponseData(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  factory InCategoryResponseData.fromJson(Map<String, dynamic> json) =>
      _$InCategoryResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$InCategoryResponseDataToJson(this);
}
