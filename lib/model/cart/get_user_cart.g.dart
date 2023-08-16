// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserCartResponseModel _$GetUserCartResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUserCartResponseModel(
      status: json['status'] as int?,
      success: json['success'] as bool,
      statusMessage: json['statusMessage'] as String?,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetUserCartData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserCartResponseModelToJson(
        GetUserCartResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'statusMessage': instance.statusMessage,
      'message': instance.message,
      'data': instance.data,
    };

GetUserCartData _$GetUserCartDataFromJson(Map<String, dynamic> json) =>
    GetUserCartData(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      date: json['date'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Map<String, int>.from(e as Map))
          .toList(),
      v: json['v'] as String?,
    );

Map<String, dynamic> _$GetUserCartDataToJson(GetUserCartData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date,
      'products': instance.products,
      'v': instance.v,
    };
