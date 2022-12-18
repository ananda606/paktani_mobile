
import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/presentation/pages/product/search_product_page.dart';
import 'package:paktani_mobile/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/widgets/product_grid_list.dart';
import 'package:paktani_mobile/presentation/widgets/product_list.dart';

class HomeProductPage extends StatefulWidget {
  static const ROUTE_NAME = '/home_product';

  HomeProductPage({
    super.key,
  });
  @override
  _HomeProductPageState createState() => _HomeProductPageState();
}

class _HomeProductPageState extends State<HomeProductPage> {
  ProductApi productApi = ProductApi();
  @override
  void initState() {
    super.initState();
    productApi = ProductApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(
        pageRoute: HomeProductPage.ROUTE_NAME,
      ),
      appBar: AppBar(
        title: const Text('PakTani'),
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
      body: SafeArea(
        child: FutureBuilder(
          future: productApi.getProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error.toString()}'),
              );
            } else if (snapshot.hasData) {
              List<ProductsModel>? products = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Best Product',
                        style: kHeading6,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductList(products!),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        'Our Product',
                        style: kHeading6,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductGridList(products),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
