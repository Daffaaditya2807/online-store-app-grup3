class ModelProductAll {
  String id;
  String tittle;
  String price;
  String desc;
  String category;
  String image;
  RatingAllProduct rate;

  ModelProductAll(
      {required this.id,
      required this.tittle,
      required this.price,
      required this.desc,
      required this.category,
      required this.image,
      required this.rate});

  factory ModelProductAll.fromJson(Map<String, dynamic> json) {
    return ModelProductAll(
        id: json["id"].toString(),
        tittle: json["title"],
        price: json['price'].toString(),
        desc: json['description'],
        category: json['category'],
        image: json['image'],
        rate: RatingAllProduct.fromJson(json['rating']));
  }
}

class RatingAllProduct {
  final String rate;
  final String count;

  RatingAllProduct({required this.rate, required this.count});

  factory RatingAllProduct.fromJson(Map<String, dynamic> json) {
    return RatingAllProduct(
        rate: json['rate'].toString(), count: json['count'].toString());
  }
}
