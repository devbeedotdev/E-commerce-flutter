// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponseModel _$GetAllCategoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesResponseModel(
      status: json['status'] as int?,
      success: json['success'] as bool,
      statusMessage: json['statusMessage'] as String?,
      message: json['message'] as String,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$GetAllCategoriesResponseModelToJson(
        GetAllCategoriesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'statusMessage': instance.statusMessage,
      'message': instance.message,
      'data': instance.data,
    };
