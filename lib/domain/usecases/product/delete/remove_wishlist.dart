import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/product/product_detail.dart';
import 'package:paktani_mobile/domain/repositories/product_repository.dart';

class RemoveWishlist {
  final ProductRepository repository;

  RemoveWishlist(this.repository);

  Future<Either<Failure, String>> execute(ProductDetail movie) {
    return repository.removeWishlist(movie);
  }
}
