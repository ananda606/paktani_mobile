import 'dart:convert';

import 'package:paktani_mobile/data/models/product/product_detail_model.dart';
import 'package:paktani_mobile/data/models/product/product_model.dart';
import 'package:paktani_mobile/data/models/product/product_response.dart';
import 'package:paktani_mobile/common/exception.dart';
import 'package:http/http.dart' as http;
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_top_rated_product.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getTopRatedProducts();
  Future<ProductDetailModel> getProductDetail(int id);
  Future<List<ProductModel>> getProductRecommendations(int id);
  Future<List<ProductModel>> getPopularProducts();
  Future<List<ProductModel>> searchProducts(String query);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  static final BASE_URL = 'localhost:3001';
  static final API_KEY = '';
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(Uri.parse('$BASE_URL/api/readProduct'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductDetailModel> getProductDetail(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/api/readProduct'));

    if (response.statusCode == 200) {
      return ProductDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProductRecommendations(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/api/:$id'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getPopularProducts() async {
    final response = await client.get(Uri.parse('$BASE_URL/api/readProduct'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getTopRatedProducts() async {
    final response = await client.get(Uri.parse('$BASE_URL/api/readProduct'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/api/readProductByName/?=$query'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }
}
