import 'package:json_annotation/json_annotation.dart';
part 'get_user_reponse_model.g.dart';

@JsonSerializable()
class GetUserResponseModel {
  int? status;
  bool success;
  String? statusMessage;
  String message;
  GetUserResponseData? data;

  GetUserResponseModel({
    required this.status,
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
  String? email;
  String? username;
  String? password;
  String? phone;
  String? v;
  Map<String, dynamic>? name;
  AddressData? address;

  GetUserResponseData(
      {required this.id,
      required this.email,
      required this.name,
      required this.username,
      required this.address,
      required this.password,
      required this.phone,
      required this.v});

  factory GetUserResponseData.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserResponseDataToJson(this);
}

@JsonSerializable()
class AddressData {
  Map<String, dynamic>? geolocation;
  String? street;
  String? city;
  int? number;
  String? zipCode;

  AddressData(
      {required this.geolocation,
      required this.street,
      required this.city,
      required this.number,
      required this.zipCode});

  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}
