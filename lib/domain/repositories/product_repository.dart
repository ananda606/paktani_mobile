import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/entities/product/product_detail.dart';
import 'package:paktani_mobile/common/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProduct();
  Future<Either<Failure, List<Product>>> getPopularProduct();
  Future<Either<Failure, List<Product>>> getTopRatedProduct();
  Future<Either<Failure, ProductDetail>> getProductDetail(int id);
  Future<Either<Failure, List<Product>>> getProductRecommendations(int id);
  Future<Either<Failure, List<Product>>> searchProducts(String query);
  Future<Either<Failure, String>> saveWishlist(ProductDetail product);
  Future<Either<Failure, String>> removeWishlist(ProductDetail product);
  Future<bool> isAddedWishlist(int id);
  Future<Either<Failure, List<Product>>> getWishlistProducts();
}
