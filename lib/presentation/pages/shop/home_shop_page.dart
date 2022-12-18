import 'package:flutter/material.dart';
import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/product/product_detail_page.dart';
import 'package:paktani_mobile/presentation/pages/product/search_product_page.dart';
import 'package:paktani_mobile/presentation/pages/shop/add_product_page.dart';


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
                        child: ProductGridList(products!, ),
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

class ProductGridList extends StatelessWidget {
  final List<ProductsModel> products;
  ProductGridList(this.products);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductDetailPage.ROUTE_NAME,
                  arguments: product.id,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      width: 200,
                      child: Image.asset('${product.productImageUrl}'),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      product.productName.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SafeArea(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                      Flexible(
                        child: Text(
                          product.productLocation.toString(),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ]),
                  ),
                  Text(
                    'Rp. ${product.productPrice.toString()}',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}