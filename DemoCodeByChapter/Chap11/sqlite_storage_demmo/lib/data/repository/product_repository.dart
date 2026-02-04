import 'package:sqflite/sqflite.dart';
import '../models/product_model.dart';
import '../services/database_service.dart';

class ProductRepository {
  Future<int> insert(Product product) async {
    Database db = await DatabaseService.database;
    return await db.insert('product', product.toMap());
  }

  Future<List<Product>> getAll() async {
    Database db = await DatabaseService.database;
    List<Map<String, dynamic>> result = await db.query('product');
    return result.map((e) => Product.fromMap(e)).toList();
  }

  Future<int> update(Product product) async {
    Database db = await DatabaseService.database;
    return await db.update(
      'product',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> delete(int id) async {
    Database db = await DatabaseService.database;
    return await db.delete(
      'product',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
