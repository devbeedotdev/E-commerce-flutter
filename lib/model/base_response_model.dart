import 'package:json_annotation/json_annotation.dart';
part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel {
  String? statusMessage;
  int? status;
  final String? message;
  // final bool success;
  final dynamic data;

  BaseResponseModel(
      {required this.status,
      // required this.success,
      required this.statusMessage,
      required this.message,
      this.data});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseModelToJson(this);
}
