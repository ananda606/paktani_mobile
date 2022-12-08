import 'package:cached_network_image/cached_network_image.dart';
import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/presentation/pages/product/product_detail_page.dart';
import 'package:paktani_mobile/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'package:paktani_mobile/domain/model/product_model.dart';


class HomeProductPage extends StatefulWidget {
  static const ROUTE_NAME = '/home_product';

  const HomeProductPage({super.key});
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
      drawer: DrawerApp(pageRoute: HomeProductPage.ROUTE_NAME),
      appBar: AppBar(
        title: const Text('PakTani'),
        actions: const [
          /*
          IconButton(
            
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )*/
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: productApi.getProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('something wrong!'),
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
                        'horizontal',
                        style: kHeading6,
                      ),
                      _buildSubHeading(title: 'see more', onTap: (){}),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductList(products!),
                      ),
                      Text(
                        'Our Product',
                        style: kHeading6,
                      ),
                      _buildSubHeading(title: 'see more', onTap: (){}),
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

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
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
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:product.productImageUrl,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.no_photography_outlined),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      product.productDescription.toString(),
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
                          product.productDescription.toString(),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ]),
                  ),
                  Text(
                    product.productName.toString(),
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

class ProductList extends StatelessWidget {
  final List<ProductsModel> products;

  ProductList(this.products);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: '',
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.no_photography_outlined),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
