import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_top_rated_product.dart';
//import 'package:paktani_mobile/domain/entities/product/product.dart';
//import 'package:paktani_mobile/domain/usecases/product/get_top_rated_products.dart';
import 'package:flutter/foundation.dart';

class TopRatedProductsNotifier extends ChangeNotifier {
  final GetTopRatedProducts getTopRatedProducts;

  TopRatedProductsNotifier({required this.getTopRatedProducts});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Product> _movies = [];
  List<Product> get movies => _movies;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedProducts() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedProducts.execute();

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
