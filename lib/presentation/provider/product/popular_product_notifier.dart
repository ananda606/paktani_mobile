import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_popular_product.dart';
import 'package:flutter/foundation.dart';

class PopularProductsNotifier extends ChangeNotifier {
  final GetPopularProducts getPopularProducts;

  PopularProductsNotifier(this.getPopularProducts);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Product> _movies = [];
  List<Product> get movies => _movies;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularProducts() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularProducts.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (moviesData) {
        _movies = moviesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
