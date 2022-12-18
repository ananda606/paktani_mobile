import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/presentation/widgets/detail_content.dart';
import 'package:paktani_mobile/presentation/widgets/edit_detail_content.dart';

class EditProductDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/edit_product_detail';

  final int id;
  EditProductDetailPage({required this.id});

  @override
  _EditProductDetailPageState createState() => _EditProductDetailPageState();
}

class _EditProductDetailPageState extends State<EditProductDetailPage> {
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
                return SafeArea(child: EditDetailContent(products!));
              } else {
                return const CircularProgressIndicator();
              }
            })));
  }
}
