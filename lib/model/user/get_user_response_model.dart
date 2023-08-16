import 'package:json_annotation/json_annotation.dart';

part 'get_user_response_model.g.dart';

@JsonSerializable()
class GetUserResponseModel {
  int? status;
  bool success;
  String? statusMessage;
  String message;
  List<GetUserResponseData>? data;

  GetUserResponseModel({
    this.status,
    required this.success,
    this.statusMessage,
    required this.message,
    this.data,
  });

  factory GetUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserResponseModelToJson(this);
}

@JsonSerializable()
class GetUserResponseData {
  int? id;
  String? username;
  String? email;
  String? password;
  Map? name;
  String? phone;
  Map? address;

  GetUserResponseData({
    this.id,
    this.username,
    this.password,
    this.name,
    this.email,
    this.phone,
    this.address,
  });

  factory GetUserResponseData.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserResponseDataToJson(this);
}
