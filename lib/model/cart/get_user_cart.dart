import 'package:json_annotation/json_annotation.dart';
part 'get_user_cart.g.dart';

@JsonSerializable()
class GetUserCartResponseModel {
  int? status;
  bool success;
  String? statusMessage;
  String message;
  List<GetUserCartData>? data;

  GetUserCartResponseModel({
    this.status,
    required this.success,
    this.statusMessage,
    required this.message,
    this.data,
  });

  factory GetUserCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserCartResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserCartResponseModelToJson(this);
}

@JsonSerializable()
class GetUserCartData {
  int? id;
  int? userId;
  String? date;
  List<Map<String, int>>? products;
  String? v;

  GetUserCartData({this.id, this.userId, this.date, this.products, this.v});

  factory GetUserCartData.fromJson(Map<String, dynamic> json) =>
      _$GetUserCartDataFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserCartDataToJson(this);
}
