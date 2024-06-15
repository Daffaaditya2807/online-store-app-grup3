import 'package:online_app_final_project/database/db_model_favorite.dart';

class DbCartItemModel extends DbFavoriteModel {
  int quantity;

  DbCartItemModel({
    required this.quantity,
    required super.id,
    required super.title,
    required super.desc,
    required super.price,
    required super.category,
    required super.image,
    required super.rate,
    required super.count,
  });

  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map['quantity'] = quantity;
    return map;
  }

  static DbCartItemModel fromMap(Map<String, dynamic> map) {
    return DbCartItemModel(
      id: map['id'],
      title: map['title'],
      desc: map['desc'],
      price: map['price'],
      category: map['category'],
      image: map['image'],
      rate: map['rate'],
      count: map['count'],
      quantity: map['quantity'],
    );
  }
}
