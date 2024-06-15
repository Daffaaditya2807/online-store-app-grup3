import 'package:online_app_final_project/model/all_product.dart';

class DbFavoriteModel {
  late String id;
  late String title;
  late String price;
  late String desc;
  late String category;
  late String image;
  late String rate;
  late String count;

  DbFavoriteModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.desc,
      required this.category,
      required this.image,
      required this.rate,
      required this.count});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "desc": desc,
      "price": price,
      "category": category,
      "image": image,
      "rate": rate,
      "count": count
    };
  }

  DbFavoriteModel.fromProductAll(ModelProductAll product) {
    id = product.id;
    title = product.tittle;
    desc = product.desc;
    price = product.price;
    category = product.category;
    image = product.image;
    rate = product.rate.rate
        .toString(); // Sesuaikan dengan struktur ModelProductAll
    count = product.rate.count
        .toString(); // Sesuaikan dengan struktur ModelProductAll
  }

  DbFavoriteModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    desc = map['desc'];
    price = map['price'];
    category = map['category'];
    image = map['image'];
    rate = map['rate'];
    count = map['count'];
  }
}
