// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_by_id_viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductByIdModel _$ProductByIdModelFromJson(Map<String, dynamic> json) =>
    ProductByIdModel(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductByIdModelToJson(ProductByIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'images': instance.images,
    };
