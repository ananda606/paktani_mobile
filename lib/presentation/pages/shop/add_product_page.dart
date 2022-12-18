import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/product/search_product_page.dart';
import 'package:paktani_mobile/presentation/pages/shop/home_shop_page.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});
  static const ROUTE_NAME = '/add_product';
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
   final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productLocationController =
      TextEditingController();
  final TextEditingController _productRatingController =
      TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productImageUrlController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final ProductApi _productApi = ProductApi();

  @override
  void initState() {
    super.initState();
    _productNameController;
    _productLocationController;
    _productRatingController;
    _productDescriptionController;
    _productImageUrlController;
    _productPriceController;
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
      drawer:Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits_sharp),
              title: Text('Add Product'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AddProductPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Product List'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, HomeShopPage.ROUTE_NAME);
              },
            ),
          ],
        ),
      ),
      body: ListView(children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextField(
              cursorColor: Colors.blue,
              keyboardType: TextInputType.name,
              controller: _productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product Name',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextField(
              cursorColor: Colors.blue,
              keyboardType: TextInputType.name,
              controller: _productImageUrlController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product Image',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextField(
              cursorColor: Colors.blue,
              keyboardType: TextInputType.text,
              controller: _productLocationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product Location',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextField(
              cursorColor: Colors.blue,
              controller: _productDescriptionController,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product description',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            child: TextField(
              cursorColor: Colors.blue,
              keyboardType: TextInputType.number,
              controller: _productPriceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Product Price',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                String productName = _productNameController.text;
                String productLocation = _productLocationController.text;
                String productDescription = _productDescriptionController.text;
                String productImageUrl = _productImageUrlController.text;
                int? price = int.tryParse(_productPriceController.text);
                ProductsModel productsModel = ProductsModel(
                  productName: productName,
                  productLocation: productLocation,
                  productDescription: productDescription,
                  productImageUrl: productImageUrl,
                  productPrice: price,
                );
                _productApi.createProduct(productsModel);
              },
              child: Text('Add Product')),
        ),
      ]),
    );
  }
}
