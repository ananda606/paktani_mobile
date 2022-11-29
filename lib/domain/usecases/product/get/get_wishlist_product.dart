import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/repositories/product_repository.dart';
import 'package:paktani_mobile/common/failure.dart';

class GetWishlistProducts {
  final ProductRepository _repository;

  GetWishlistProducts(this._repository);

  Future<Either<Failure, List<Product>>> execute() {
    return _repository.getWishlistProducts();
  }
}
