import 'package:json_annotation/json_annotation.dart';
part 'product_details_viewmodel.g.dart';

@JsonSerializable()
class Category {
  Category({required this.id, required this.name});
  String? id;
  String? name;
  factory Category.fromJson(Map<String, dynamic> json) {
    print('json$json');
    return _$CategoryFromJson(json);
  }
  //convert json to dart
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class ProductDetailsModel {
  String? id;
  String? description;
  String? title;
  double? price;
  List<String>? images;
  final Category category;
  ProductDetailsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.images,
      required this.category});
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    print('json$json');
    return _$ProductDetailsModelFromJson(json);
  }
  //convert json to dart
  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
//convert dart to json
}
