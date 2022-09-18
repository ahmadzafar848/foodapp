import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/cart_product_model.dart';

class DbHelper {
  static Database? _db;
  static const String databaseName = 'product.db';
  static const int version = 1;

  static Future<Database?> database() async {
    if (_db != null) {
      return _db;
    }
    return _db = await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: _onCreate,
    );
  }
}

void _onCreate(Database db, int version) async {
  await db.execute(CartProductModel.createTable);
}
