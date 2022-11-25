import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/domain/entities/product.dart';
import 'package:paktani_mobile/domain/usecases/product/search_products.dart';
import 'package:flutter/foundation.dart';

class ProductSearchNotifier extends ChangeNotifier {
  final SearchProducts searchProducts;

  ProductSearchNotifier({required this.searchProducts});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Product> _searchResult = [];
  List<Product> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchProductSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchProducts.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
