// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserResponseModel _$GetUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUserResponseModel(
      status: json['status'] as int?,
      success: json['success'] as bool,
      statusMessage: json['statusMessage'] as String?,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetUserResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserResponseModelToJson(
        GetUserResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'statusMessage': instance.statusMessage,
      'message': instance.message,
      'data': instance.data,
    };

GetUserResponseData _$GetUserResponseDataFromJson(Map<String, dynamic> json) =>
    GetUserResponseData(
      id: json['id'] as int?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] as Map<String, dynamic>?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GetUserResponseDataToJson(
        GetUserResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };
