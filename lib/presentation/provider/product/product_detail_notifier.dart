import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/entities/product/product_detail.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_product_detail.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_recommendation_product.dart';
import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_Wishlist_status.dart';
import 'package:paktani_mobile/domain/usecases/product/delete/remove_Wishlist.dart';
import 'package:paktani_mobile/domain/usecases/product/post/save_wishlist_product.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ProductDetailNotifier extends ChangeNotifier{
   static const wishlistAddSuccessMessage = 'Added to Wishlist';
  static const wishlistRemoveSuccessMessage = 'Removed from Wishlist';

  final GetProductDetail getProductDetail;
  final GetProductRecommendations getProductRecommendations;
  final GetWishlistStatus getWishlistStatus;
  final SaveWishlist saveWishlist;
  final RemoveWishlist removeWishlist;

  ProductDetailNotifier({
    required this.getProductDetail,
    required this.getProductRecommendations,
    required this.getWishlistStatus,
    required this.saveWishlist,
    required this.removeWishlist,
  });

  late ProductDetail _Product;
  ProductDetail get product => _Product;

  RequestState _ProductState = RequestState.Empty;
  RequestState get ProductState => _ProductState;

  List<Product> _ProductRecommendations = [];
  List<Product> get ProductRecommendations => _ProductRecommendations;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWishlist = false;
  bool get isAddedToWishlist => _isAddedtoWishlist;

  Future<void> fetchProductDetail(int id) async {
    _ProductState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getProductDetail.execute(id);
    final recommendationResult = await getProductRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _ProductState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (Product) {
        _recommendationState = RequestState.Loading;
        _Product = product;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
          (Products) {
            _recommendationState = RequestState.Loaded;
            _ProductRecommendations = Products;
          },
        );
        _ProductState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _WishlistMessage = '';
  String get WishlistMessage => _WishlistMessage;

  Future<void> addWishlist(ProductDetail Product) async {
    final result = await saveWishlist.execute(Product);

    await result.fold(
      (failure) async {
        _WishlistMessage = failure.message;
      },
      (successMessage) async {
        _WishlistMessage = successMessage;
      },
    );

    await loadWishlistStatus(product.id);
  }

  Future<void> removeFromWishlist(ProductDetail Product) async {
    final result = await removeWishlist.execute(Product);

    await result.fold(
      (failure) async {
        _WishlistMessage = failure.message;
      },
      (successMessage) async {
        _WishlistMessage = successMessage;
      },
    );

    await loadWishlistStatus(product.id);
  }

  Future<void> loadWishlistStatus(int id) async {
    final result = await getWishlistStatus.execute(id);
    _isAddedtoWishlist = result;
    notifyListeners();
  }
}
