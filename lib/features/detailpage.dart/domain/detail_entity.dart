///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class ProductDetailEntityRating {
/*
{
  "rate": 3.9,
  "count": 120
} 
*/

  double? rate;
  int? count;

  ProductDetailEntityRating({
    this.rate,
    this.count,
  });
  ProductDetailEntityRating.fromJson(Map<String, dynamic> json) {
    rate = json['rate']?.toDouble();
    count = json['count']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}

class ProductDetailEntity {
/*
{
  "id": 1,
  "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
  "price": 109.95,
  "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
  "category": "men's clothing",
  "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  "rating": {
    "rate": 3.9,
    "count": 120
  }
} 
*/

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  ProductDetailEntityRating? rating;

  ProductDetailEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
}
