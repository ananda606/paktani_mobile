import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:paktani_mobile/presentation/widgets/product_card_list.dart';

class PopularProductsPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-movie';

  @override
  _PopularProductsPageState createState() => _PopularProductsPageState();
}

class _PopularProductsPageState extends State<PopularProductsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductApi productApi = new ProductApi();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Products'),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: productApi.getProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('something wrong'),
                );
              }
              if (snapshot.hasData) {
                ProductsModel? productsModel;
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ProductCard(productsModel!);
                      },
                      itemCount:1,
                    ));
              } else {
                return const Center(
                  key: Key('error_message'),
                  child: Text('errpr'),
                );
              }
            }),
      ),
    );
  }
}
