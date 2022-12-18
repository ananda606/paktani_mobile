import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/presentation/widgets/detail_content.dart';

class ProductDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail';

  final int id;
  ProductDetailPage({required this.id});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  ProductApi productApi = new ProductApi();
  @override
  void initState() {
    super.initState();
    productApi = ProductApi();
    productApi.getProductById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: productApi.getProductById(widget.id),
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('something wrong!'));
              } else if (snapshot.hasData) {
                late List<ProductsModel>? products = snapshot.data;
                bool isAddedWishlist = false;
                return SafeArea(child: DetailContent(products!));
              } else {
                return const CircularProgressIndicator();
              }
            })));
  }
}
