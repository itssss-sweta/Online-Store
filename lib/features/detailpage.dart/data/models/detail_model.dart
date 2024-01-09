import 'package:online_store/features/detailpage.dart/domain/detail_entity.dart';
import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel? data) =>
    json.encode(data?.toJson());

class ProductDetailModel extends ProductDetailEntity {
  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    price = json['price']?.toDouble();
    description = json['description']?.toString();
    category = json['category']?.toString();
    image = json['image']?.toString();
    rating = (json['rating'] != null)
        ? ProductDetailEntityRating.fromJson(json['rating'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}
