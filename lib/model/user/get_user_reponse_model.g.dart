// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_reponse_model.dart';

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
      data: json['data'] == null
          ? null
          : GetUserResponseData.fromJson(json['data'] as Map<String, dynamic>),
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
      email: json['email'] as String?,
      name: json['name'] as Map<String, dynamic>?,
      username: json['username'] as String?,
      address: json['address'] == null
          ? null
          : AddressData.fromJson(json['address'] as Map<String, dynamic>),
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      v: json['v'] as String?,
    );

Map<String, dynamic> _$GetUserResponseDataToJson(
        GetUserResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'phone': instance.phone,
      'v': instance.v,
      'name': instance.name,
      'address': instance.address,
    };

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData(
      geolocation: json['geolocation'] as Map<String, dynamic>?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      number: json['number'] as int?,
      zipCode: json['zipCode'] as String?,
    );

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'geolocation': instance.geolocation,
      'street': instance.street,
      'city': instance.city,
      'number': instance.number,
      'zipCode': instance.zipCode,
    };
