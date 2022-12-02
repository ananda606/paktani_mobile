import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Product {
  int id;
  String productName;
  String productDescription;
  String productImageUrl;

  Product.fromJson(Map json)
      : id = json['id'],
        productName = json['productName'],
        productDescription = json['productDescription'],
        productImageUrl = json['productImageUrl'];
  Map toJson() {
    return {
      'id': id,
      'productName': productName,
      'productDescription': productDescription,
      'productImageUrl': productImageUrl,
    };
  }
}

class ProductApi {
  static Future getProduct() {
    return http.get(Uri.parse("http://localhost:3001/api/readProduct"));
  }
}

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
 
  List<Product>? productList;
  void getProductFromApi() async {
    ProductApi.getProduct().then((value) => setState(() {
          Iterable list = json.decode(value.body);
          productList = list.map((e) => Product.fromJson(e)).toList();
        }));
  }

  @override
  void initState() {
    super.initState();
    getProductFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView.builder(
          itemCount: productList?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(productList![index].id.toString()),
              subtitle: Text(productList![index].productDescription),
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(productList![index].productImageUrl),
              ),
            );
          }),
    ));
  }
}
