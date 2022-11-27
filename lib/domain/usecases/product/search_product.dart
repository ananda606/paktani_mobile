import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/Product.dart';
import 'package:paktani_mobile/domain/repositories/Product_repository.dart';

class SearchProducts {
  final ProductRepository repository;

  SearchProducts(this.repository);

  Future<Either<Failure, List<Product>>> execute(String query) {
    return repository.searchProducts(query);
  }
}
