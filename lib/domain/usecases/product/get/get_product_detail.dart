import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/entities/product/product_detail.dart';
import 'package:paktani_mobile/domain/repositories/product_repository.dart';
import 'package:paktani_mobile/common/failure.dart';

class GetProductDetail {
  final ProductRepository repository;
  GetProductDetail(this.repository);
  Future<Either<Failure, ProductDetail>> execute(int id) {
    return repository.getProductDetail(id);
  }
}
