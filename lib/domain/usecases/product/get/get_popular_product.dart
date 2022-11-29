import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/repositories/product_repository.dart';

class GetPopularProducts {
  final ProductRepository repository;

  GetPopularProducts(this.repository);

  Future<Either<Failure, List<Product>>> execute() {
    return repository.getProduct();
  }
}
