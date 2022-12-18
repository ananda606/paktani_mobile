import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/product/search_product_page.dart';

class HomeShopPage extends StatefulWidget {
  const HomeShopPage({super.key});
  static const ROUTE_NAME = '/home_shop';
  @override
  State<HomeShopPage> createState() => _HomeShopPageState();
}

class _HomeShopPageState extends State<HomeShopPage> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productLocationController = TextEditingController();
  TextEditingController _productRatingController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productImageUrlController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _productNameController = TextEditingController();
    _productLocationController = TextEditingController();
    _productRatingController = TextEditingController();
    _productDescriptionController = TextEditingController();
    _productImageUrlController = TextEditingController();
    _productPriceController = TextEditingController();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productLocationController.dispose();
    _productRatingController.dispose();
    _productDescriptionController.dispose();
    _productImageUrlController.dispose();
    _productPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProductApi productApi = ProductApi();
    ProductsModel productsModel = ProductsModel(
      productName: _productNameController.text,
      productLocation: _productLocationController.text,
      productDescription: _productDescriptionController.text,
      productImageUrl: _productImageUrlController.text,
      productPrice: double.parse(_productPriceController.text),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('PakTani'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                SearchProductPage.ROUTE_NAME,
              );
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          ListTile(
            leading: const Icon(Icons.production_quantity_limits),
            title: Text('insert Product'),
          ),
        ]),
      ),
      body: SafeArea(
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "must not empty";
                } else {
                  return null;
                }
              },
              cursorColor: Colors.blue,
              controller: _productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product Name',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "must not empty";
                } else {
                  return null;
                }
              },
              cursorColor: Colors.blue,
              controller: _productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product Name',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "must not empty";
                } else {
                  return null;
                }
              },
              cursorColor: Colors.blue,
              controller: _productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product Name',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "must not empty";
                } else {
                  return null;
                }
              },
              cursorColor: Colors.blue,
              controller: _productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product Name',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "must not empty";
                } else {
                  return null;
                }
              },
              cursorColor: Colors.blue,
              controller: _productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product Name',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
