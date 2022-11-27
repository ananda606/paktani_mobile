import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/product/product_detail.dart';
import 'package:paktani_mobile/domain/repositories/product_repository.dart';

class SaveWishlist {
  final ProductRepository repository;

  SaveWishlist(this.repository);

  Future<Either<Failure, String>> execute(ProductDetail movie) {
    return repository.saveWishlist(movie);
  }
}
