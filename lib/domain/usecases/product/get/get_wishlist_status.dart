import 'package:paktani_mobile/domain/repositories/product_repository.dart';

class GetWishlistStatus {
  final ProductRepository repository;

  GetWishlistStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedWishlist(id);
  }
}
