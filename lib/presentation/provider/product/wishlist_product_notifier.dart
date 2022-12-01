import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_wishlist_product.dart';
import 'package:flutter/foundation.dart';

class WishlistProductNotifier extends ChangeNotifier {
  var _watchlistMovies = <Product>[];
  List<Product> get watchlistMovies => _watchlistMovies;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WishlistProductNotifier({required this.getWatchlistMovies});

  final GetWishlistProducts getWatchlistMovies;

  Future<void> fetchWatchlistMovies() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistMovies.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _watchlistState = RequestState.Loaded;
        _watchlistMovies = moviesData;
        notifyListeners();
      },
    );
  }
}
