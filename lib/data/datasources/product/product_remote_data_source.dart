import 'dart:convert';

import 'package:paktani_mobile/data/models/product/product_detail_model.dart';
import 'package:paktani_mobile/data/models/product/product_model.dart';
import 'package:paktani_mobile/data/models/product/product_response.dart';
import 'package:paktani_mobile/common/exception.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductDetailModel> getProductDetail(int id);
  Future<List<ProductModel>> getProductRecommendations(int id);
  Future<List<ProductModel>> getPopularProducts();
  Future<List<ProductModel>> searchProducts(String query);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  static final BASE_URL;
  static final API_KEY;
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});
  @override
  Future<List<ProductModel>> getProducts() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/now_playing?$API_KEY'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductDetailModel> getProductDetail(int id) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return ProductDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProductRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getPopularProducts() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getTopRatedProducts() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'));

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body)).productList;
    } else {
      throw ServerException();
    }
  }
}
