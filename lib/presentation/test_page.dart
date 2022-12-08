import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

class Product {
  int? id;
  String productName;
  String productDescription;
  String productImageUrl;
  Product({
    this.id,
    required this.productName,
    required this.productDescription,
    required this.productImageUrl,
  });
  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        productName: map['productName'],
        productDescription: map['productDescription'],
        productImageUrl: map['productImageUrl']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'productDescription': productDescription,
      'productImageUrl': productImageUrl,
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $productName, productDescription: $productDescription, productImageUrl: $productImageUrl}';
  }
}

List<Product> productFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Product>.from(data.map((item) => Product.fromJson(item)));
}

String productToJson(Product data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class ProductApi {
  final String url = "http://10.0.2.2:3001/api";
  Client client = Client();
  Future<List<Product>?> getProduct() async {
    final response = await client.get(Uri.parse("$url/readProduct"));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createProduct(Product data) async {
    final response = await client.post(Uri.parse("$url/createProduct"),
        body: productToJson(data),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Product data) async {
    final response = await client.put(
      Uri.parse("$url/api/updateProductById/${data.id}"),
      headers: {"content-type": "application/json"},
      body: productToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteProfile(int id) async {
    final response = await client.delete(
      Uri.parse("$url/api/deleteProductById/$id") ,
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

//final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormAddScreen extends StatefulWidget {
  @override
  _FormAddScreenState createState() => _FormAddScreenState();
}

class _FormAddScreenState extends State<FormAddScreen> {
  bool _isLoading = false;
  final ProductApi _apiService = ProductApi();
  bool _isFieldNameValid = false;
  bool _isFieldEmailValid = false;
  bool _isFieldAgeValid = false;
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController = TextEditingController();
  final TextEditingController _productImageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // key: _scaffoldState,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Form Add",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldName(),
                _buildTextFieldEmail(),
                _buildTextFieldAge(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_isFieldNameValid ||
                          !_isFieldEmailValid ||
                          !_isFieldAgeValid) {
                       // _scaffoldState.currentState;
                        return;
                      }
                      setState(() => _isLoading = true);
                      String prodName = _productNameController.text.toString();
                      String desc =
                          _productDescriptionController.text.toString();
                      String image = _productImageUrlController.text.toString();
                      Product profile = Product(
                          productName: prodName,
                          productDescription: desc,
                          productImageUrl: image);
                      _apiService.createProduct(profile).then((isSuccess) {
                        setState(() => _isLoading = false);/*
                        if (isSuccess) {
                          Navigator.pop(_scaffoldState.currentState!.context);
                        } else {
                          _scaffoldState.currentState;
                        }*/
                      });
                    },
                    child: Text(
                      "Submit".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    const Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _productNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full name",
        errorText: _isFieldNameValid
            ? null
            : "Full name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldEmail() {
    return TextField(
      controller: _productDescriptionController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        errorText: _isFieldEmailValid
            ? null
            : "Email is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldAge() {
    return TextField(
      controller: _productImageUrlController,
      keyboardType: TextInputType.url,
      decoration: InputDecoration(
        labelText: "imageurl",
        errorText: _isFieldAgeValid
            ? null
            : "url required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAgeValid) {
          setState(() => _isFieldAgeValid = isFieldValid);
        }
      },
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  ProductApi productApi = ProductApi();
  @override
  void initState() {
    super.initState();
    productApi = ProductApi();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    ProductApi().getProduct().then(((value) => print("value: $value")));
    return SafeArea(
        child: FutureBuilder(
      future: productApi.getProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('something wrong'));
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<Product>? product = snapshot.data;
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                Product productsList = product[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            productsList.productName,
                          ),
                          Text(productsList.productDescription),
                          Text(productsList.id.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: product!.length,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

