import 'package:paktani_mobile/common/exception.dart';

import 'package:paktani_mobile/data/datasources/db/database_helper_product.dart';
import 'package:paktani_mobile/data/models/product/product_table.dart';

abstract class ProductLocalDataSource {
  Future<String> insertWishlist(ProductTable productTable);
  Future<String> removeWishlist(ProductTable productTable);
  Future<ProductTable?> getProductById(int id);
  Future<List<ProductTable>> getWishlistProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final DatabaseHelperProduct databaseHelperProduct;
  ProductLocalDataSourceImpl({
    required this.databaseHelperProduct,
  });
  @override
  Future<String> insertWishlist(ProductTable productTable) async {
    try {
      await databaseHelperProduct.insertWishlist(productTable);
      return 'Added to Wishlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWishlist(ProductTable productTable) async {
    try {
      await databaseHelperProduct.removeWishlist(productTable);
      return 'Removed from Wishlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<ProductTable?> getProductById(int id) async {
    final result = await databaseHelperProduct.getProductById(id);
    if (result != null) {
      return ProductTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<ProductTable>> getWishlistProducts() async {
    final result = await databaseHelperProduct.getWishlistProducts();
    return result.map((data) => ProductTable.fromMap(data)).toList();
  }
}
