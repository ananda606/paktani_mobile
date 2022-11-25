import 'dart:async';
import 'package:paktani_mobile/data/models/product/product_model.dart';
import 'package:paktani_mobile/data/models/product/product_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperProduct {
  static DatabaseHelperProduct? _databaseHelperProduct;
  DatabaseHelperProduct._instance() {
    _databaseHelperProduct = this;
  }
  factory DatabaseHelperProduct() =>
      _databaseHelperProduct ?? DatabaseHelperProduct._instance();
  static Database? _database;
  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }

  static const String _tblWishlist = 'wishlist';
  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/paktani_mobile.db';
    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE  $_tblWishlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
      ''');
  }

  Future<int> insertWishlist(ProductTable productTable) async {
    final db = await database;
    return await db!.insert(_tblWishlist, productTable.toJson());
  }

  Future<int> removeWishlist(ProductTable product) async {
    final db = await database;
    return await db!.delete(
      _tblWishlist,
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<Map<String, dynamic>?> getProductById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWishlist,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWishlistProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblWishlist);

    return results;
  }
}
