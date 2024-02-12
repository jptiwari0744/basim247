import 'package:json_annotation/json_annotation.dart';
part 'product_by_id_viewmodel.g.dart';

@JsonSerializable()
class ProductByIdModel {
  String id;
  String title;
  double price;
  List<String> images;
  ProductByIdModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.images});
  factory ProductByIdModel.fromJson(Map<String, dynamic> json) {
    print('json$json');
    return _$ProductByIdModelFromJson(json);
  }
  //convert json to dart
  Map<String, dynamic> toJson() => _$ProductByIdModelToJson(this);
//convert dart to json
}
