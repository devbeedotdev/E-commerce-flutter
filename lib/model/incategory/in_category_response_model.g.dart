// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InCategoryResponseModel _$InCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    InCategoryResponseModel(
      data: json['data'],
    );

Map<String, dynamic> _$InCategoryResponseModelToJson(
        InCategoryResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

InCategoryResponseData _$InCategoryResponseDataFromJson(
        Map<String, dynamic> json) =>
    InCategoryResponseData(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$InCategoryResponseDataToJson(
        InCategoryResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };
