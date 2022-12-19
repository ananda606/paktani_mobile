import 'package:http/http.dart';

import 'package:paktani_mobile/domain/model/product_model.dart';

class ProductApi {
  final String url = "http://10.0.2.2:3001/api";
  Client client = Client();
  Future<List<ProductsModel>?> getProduct() async {
    final response = await client.get(Uri.parse("$url/readProduct"));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<ProductsModel>?> getPopularProduct() async {
    final response = await client.get(Uri.parse("$url/readPopularProduct"));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<ProductsModel>?> getProductById(int id) async {
    final response = await client.get(Uri.parse("$url/readProductById/$id"));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<ProductsModel>?> getProductByName(String productName) async {
    final response =
        await client.get(Uri.parse("$url/readProductByName/$productName"));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createProduct(ProductsModel data) async {
    final response = await client.post(Uri.parse("$url/createProduct"),
        body: productToJson(data),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      print('create success');
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProduct(ProductsModel data) async {
    final response = await client.put(
      Uri.parse("$url/api/updateProductById/${data.id}"),
      body: productToJson(data),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      print('update success');
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProduct(int id) async {
    final response = await client.delete(
      Uri.parse("$url/api/deleteProduct/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
