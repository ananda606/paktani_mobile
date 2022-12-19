import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/product/search_product_page.dart';
import 'package:paktani_mobile/presentation/pages/shop/home_shop_page.dart';

class EditProductPage extends StatefulWidget {
  ProductsModel productsModel;
  EditProductPage({super.key, required this.productsModel});
  static const ROUTE_NAME = '/edit_product';

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
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
  late ProductApi _productApi;

  @override
  void initState() {
    super.initState();
    if (widget.productsModel != null) {
      _productNameController.text = widget.productsModel.productName;
      _productLocationController.text = widget.productsModel.productLocation;
      _productImageUrlController.text = widget.productsModel.productImageUrl;
      _productRatingController.text = widget.productsModel.productRating.toString();
      _productDescriptionController.text =
          widget.productsModel.productDescription;
      _productPriceController.text =
          widget.productsModel.productPrice.toString();
    }
    _productNameController;
    _productLocationController;
    _productRatingController;
    _productDescriptionController;
    _productImageUrlController;
    _productPriceController;
    _productApi = ProductApi();
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
      drawer: Drawer(
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
                    context, EditProductPage.ROUTE_NAME);
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
        Text('${widget.productsModel.id}'),
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: widget.productsModel.productName,
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: widget.productsModel.productImageUrl,
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: widget.productsModel.productLocation,
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: widget.productsModel.productDescription,
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
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: widget.productsModel.productPrice.toString(),
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
              onPressed: () async {
                String productName = _productNameController.text;
                String productLocation = _productLocationController.text;
                String productDescription = _productDescriptionController.text;
                String productImageUrl = _productImageUrlController.text;
                double? rating=double.tryParse(_productRatingController.text);
                int? price = int.tryParse(_productPriceController.text);

                ProductsModel productsModel = ProductsModel(
                  productName: productName,
                  productLocation: productLocation,
                  productDescription: productDescription,
                  productImageUrl: productImageUrl,
                  productRating: rating,
                  productPrice: price,
                );
                productsModel.id = widget.productsModel.id;
                print(productsModel.productName);
                print(productsModel);

                _productApi.updateProduct(productsModel);
                Navigator.pushReplacementNamed(
                    context, HomeShopPage.ROUTE_NAME);
              },
              child: Text('Edit Product')),
        ),
      ]),
    );
  }
}
