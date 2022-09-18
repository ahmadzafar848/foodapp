import 'package:meher_kitchen/utils/local_database/product_db_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/cart_product_model.dart';

class ProductDbProvider {
  Future<bool> insertProduct(CartProductModel model) async {
    Database? database = await DbHelper.database();
    int rows =
        await database!.insert(CartProductModel.tableName, model.toMap());
    if (rows < 0) {
      return false;
    }
    return true;
  }

  Future<bool> updateProduct(CartProductModel model) async {
    Database? database = await DbHelper.database();
    int rows = await database!.update(
        CartProductModel.tableName,
        {
          CartProductModel.columnQuantity: model.quantity,
          CartProductModel.columnPrice: model.price
        },
        where: '${CartProductModel.columnProductId} = ? ',
        whereArgs: [model.productId]);
    if (rows > 0) {
      return true;
    }
    return false;
  }

  Future<bool> deleteProduct(CartProductModel model) async {
    Database? database = await DbHelper.database();
    int rows = await database!.delete(CartProductModel.tableName,
        where: '${CartProductModel.columnProductId}= ?',
        whereArgs: [model.productId]);
    if (rows > 0) {
      return true;
    }
    return false;
  }

  Future<bool> deleteAllProducts() async {
    Database? database = await DbHelper.database();
    int rows = await database!.delete('productTable');
    if (rows > 0) {
      return true;
    }
    return false;
  }

  Future<List<CartProductModel>> fetchProductFromDb() async {
    Database? database = await DbHelper.database();
    List list = await database!.query(CartProductModel.tableName);
    return list.map((e) => CartProductModel.fromMap(e)).toList();
  }
}
