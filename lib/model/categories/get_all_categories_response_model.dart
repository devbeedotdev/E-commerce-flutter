import 'package:json_annotation/json_annotation.dart';

part 'get_all_categories_response_model.g.dart';

@JsonSerializable()
class GetAllCategoriesResponseModel {
  int? status;
  bool success;
  String? statusMessage;
  String message;
  List? data;

  GetAllCategoriesResponseModel({
    this.status,
    required this.success,
    this.statusMessage,
    required this.message,
    this.data,
  });

  factory GetAllCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllCategoriesResponseModelToJson(this);
}
