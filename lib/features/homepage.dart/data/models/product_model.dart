import 'dart:convert';

import 'package:online_store/features/homepage.dart/domain/entity/product_entity.dart';

List<HomePageModel> homePageModelFromJson(String str)
// =>
//     HomePageModel.fromJson(json.decode(str));
{
  List<dynamic> jsonList = json.decode(str);
  return jsonList.map((json) => HomePageModel.fromJson(json)).toList();
}

String homePageModelToJson(HomePageModel? data) => json.encode(data?.toJson());

class HomePageModel extends ProductListEntity {
  HomePageModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    price = json['price']?.toDouble();
    description = json['description']?.toString();
    category = json['category']?.toString();
    image = json['image']?.toString();
    rating = (json['rating'] != null)
        ? ProductListEntityRating.fromJson(json['rating'])
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
