import 'package:online_app_final_project/database/db_model_cart_item.dart';
import 'package:online_app_final_project/database/db_model_favorite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperFavorite {
  static DatabaseHelperFavorite? _databaseHelperFavorite;
  static late Database _database;

  DatabaseHelperFavorite._internal() {
    _databaseHelperFavorite = this;
  }

  factory DatabaseHelperFavorite() =>
      _databaseHelperFavorite ?? DatabaseHelperFavorite._internal();

  Future<Database> get database async {
    _database = await initialzeDb();
    return _database;
  }

  static const String tableName = "favoriteItem";
  static const String tableCart = "listCartItem";
  Future<Database> initialzeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(join(path, 'favoriteDb.db'),
        onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE $tableName (
               id CHAR PRIMARY KEY,
               title TEXT, desc TEXT , price TEXT , category TEXT , image TEXT , rate TEXT , count TEXT
             )''',
      );
      await db.execute(
        '''CREATE TABLE $tableCart (
             id CHAR PRIMARY KEY,
             title TEXT, desc TEXT, price TEXT, category TEXT, image TEXT, rate TEXT, count TEXT, quantity INTEGER
           )''',
      );
    }, onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < 2) {
        await db.execute(
          '''CREATE TABLE $tableCart (
             id CHAR PRIMARY KEY,
             title TEXT, desc TEXT, price TEXT, category TEXT, image TEXT, rate TEXT, count TEXT, quantity INTEGER
           )''',
        );
      }
    }, version: 2);
    return db;
  }

  // Favorite Item

  Future<void> insertFavoriteItem(DbFavoriteModel db) async {
    final Database _database = await database;
    await _database.insert(tableName, db.toMap());
    print("data saved");
  }

  Future<List<DbFavoriteModel>> getListFavItem() async {
    final Database _database = await database;
    List<Map<String, dynamic>> results = await _database.query(tableName);
    return results.map((res) => DbFavoriteModel.fromMap(res)).toList();
  }

  Future<DbFavoriteModel> getListFavItembyId(int id) async {
    final Database _database = await database;
    List<Map<String, dynamic>> results =
        await _database.query(tableName, where: "id=?", whereArgs: [id]);
    return results.map((res) => DbFavoriteModel.fromMap(res)).first;
  }

  Future<void> deleteFavItem(String id) async {
    final _database = await database;
    await _database.delete(tableName, where: "id = ?", whereArgs: [id]);
  }

  Future<bool> isFavorite(String id) async {
    final _database = await database;
    List<Map> maps = await _database.query(tableName,
        columns: ['id'], where: "id = ?", whereArgs: [id]);
    return maps.isNotEmpty;
  }

  // Cart Item
  Future<void> insertCartItem(DbCartItemModel item) async {
    final Database db = await database;
    await db.insert(tableCart, item.toMap());
    print("Cart item saved");
  }

  Future<List<DbCartItemModel>> getListCartItems() async {
    final Database db = await database;
    final List<Map<String, dynamic>> results = await db.query(tableCart);
    return results.map((res) => DbCartItemModel.fromMap(res)).toList();
  }

  Future<void> deleteCartItem(String id) async {
    final Database db = await database;
    await db.delete(tableCart, where: "id = ?", whereArgs: [id]);
  }

  Future<DbCartItemModel> getCartItemById(String id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> results =
        await db.query(tableCart, where: "id = ?", whereArgs: [id]);
    return results.map((res) => DbCartItemModel.fromMap(res)).first;
  }

  Future<void> insertOrUpdateCartItem(DbCartItemModel item) async {
    final Database db = await database;
    List<Map> existingItems =
        await db.query(tableCart, where: "id = ?", whereArgs: [item.id]);
    if (existingItems.isNotEmpty) {
      int newQuantity = existingItems.first['quantity'] + 1;
      await db.update(tableCart, {'quantity': newQuantity},
          where: "id = ?", whereArgs: [item.id]);
      print("quantity Update");
    } else {
      await db.insert(tableCart, item.toMap());
      print("Cart item saved");
    }
  }

  Future<void> incrementCartItemById(DbCartItemModel item) async {
    final Database db = await database;
    List<Map> existingItems =
        await db.query(tableCart, where: "id = ?", whereArgs: [item.id]);
    int newQuantity = existingItems.first['quantity'] + 1;
    await db.update(tableCart, {'quantity': newQuantity},
        where: "id = ?", whereArgs: [item.id]);

    print("quantity Increment");
  }

  Future<void> decrementtCartItemById(DbCartItemModel item) async {
    final Database db = await database;
    List<Map> existingItems =
        await db.query(tableCart, where: "id = ?", whereArgs: [item.id]);
    int newQuantity = existingItems.first['quantity'] - 1;
    await db.update(tableCart, {'quantity': newQuantity},
        where: "id = ?", whereArgs: [item.id]);
    print("quantity Decrement");
  }
}
