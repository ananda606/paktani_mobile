import 'package:flutter/material.dart';
import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/product/product_detail_page.dart';
import 'package:paktani_mobile/presentation/pages/product/search_product_page.dart';
import 'package:paktani_mobile/presentation/pages/shop/add_product_page.dart';
//import 'package:paktani_mobile/presentation/pages/shop/edit_product_page.dart';
//import 'package:paktani_mobile/presentation/pages/shop/list_product_page.dart';
import 'package:paktani_mobile/presentation/widgets/edit_product_grid_list.dart';
import 'package:paktani_mobile/presentation/widgets/product_grid_list.dart';


class HomeShopPage extends StatefulWidget {
  
  const HomeShopPage({super.key, });
  static const ROUTE_NAME = '/home_shop';
  @override
  State<HomeShopPage> createState() => _HomeShopPageState();
}

class _HomeShopPageState extends State<HomeShopPage> {
  final ProductApi _productApi = ProductApi();

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
        FutureBuilder(
          future: _productApi.getProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error.toString()}'),
              );
            } else if (snapshot.hasData) {
              List<ProductsModel>? products = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Product',
                        style: kHeading6,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EditProductGridList(products!, ),
                      ),
                    ]),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ]),
    );
  }
}
