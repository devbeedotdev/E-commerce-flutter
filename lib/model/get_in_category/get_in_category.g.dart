// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_in_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInCategoryResponseModel _$GetInCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetInCategoryResponseModel(
      status: json['status'] as int?,
      success: json['success'] as bool,
      statusMessage: json['statusMessage'] as String?,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetInCategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetInCategoryResponseModelToJson(
        GetInCategoryResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'statusMessage': instance.statusMessage,
      'message': instance.message,
      'data': instance.data,
    };

GetInCategoryData _$GetInCategoryDataFromJson(Map<String, dynamic> json) =>
    GetInCategoryData(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GetInCategoryDataToJson(GetInCategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };
