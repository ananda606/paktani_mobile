
import 'package:paktani_mobile/domain/entities/product.dart';
import 'package:paktani_mobile/domain/usecases/product/get_product_detail.dart';
import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/domain/usecases/product/get_recommendation_product.dart';

import 'package:flutter/material.dart';
import 'package:paktani_mobile/data/models/product/product_model.dart';
import 'package:paktani_mobile/presentation/provider/top_rated_movies_notifier.dart';

class ProductListNotifier extends ChangeNotifier {
  var _productList = <ProductModel>[];
  List<ProductModel> get productList => _productList;
  //init request state
  RequestState _productListState = RequestState.Empty;
  RequestState get productListState => _productListState;

  var _popularProducts = <Product>[];
  List<Product> get popularProducts => _popularProducts;

  RequestState _popularProductsState = RequestState.Empty;
  RequestState get popularProductsState => _popularProductsState;

  var _topRatedProducts = <Product>[];
  List<Product> get topRatedProducts => _topRatedProducts;

  RequestState _topRatedProductsState = RequestState.Empty;
  RequestState get topRatedProductsState => _topRatedProductsState;

  String _message = '';
  String get message => _message;

  ProductListNotifier({
    required this.getNowPlayingProducts,
    required this.getPopularProducts,
    required this.getTopRatedProducts,
  });

  final GetProductDetail getNowPlayingProducts;
  final GetPopularProducts getPopularProducts;
  final GetTopRatedProducts getTopRatedProducts;

  Future<void> fetchNowPlayingProducts() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingProducts.execute();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (ProductsData) {
        _nowPlayingState = RequestState.Loaded;
        _nowPlayingProducts = ProductsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularProducts() async {
    _popularProductsState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularProducts.execute();
    result.fold(
      (failure) {
        _popularProductsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (ProductsData) {
        _popularProductsState = RequestState.Loaded;
        _popularProducts = ProductsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedProducts() async {
    _topRatedProductsState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedProducts.execute();
    result.fold(
      (failure) {
        _topRatedProductsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (ProductsData) {
        _topRatedProductsState = RequestState.Loaded;
        _topRatedProducts = ProductsData;
        notifyListeners();
      },
    );
  }
}
