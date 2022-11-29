import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/repositories/product_repository.dart';
import 'package:paktani_mobile/common/failure.dart';

class GetProductRecommendations {
  final ProductRepository repository;

  GetProductRecommendations(this.repository);

  Future<Either<Failure, List<Product>>> execute(id) {
    return repository.getProductRecommendations(id);
  }
}
