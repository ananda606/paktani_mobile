import 'package:flutter/material.dart';

import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/product/home_product_page.dart';
import 'package:paktani_mobile/presentation/pages/product/product_detail_page.dart';

class SearchProductPage extends StatefulWidget {
  static const ROUTE_NAME = '/search_page';
  const SearchProductPage({super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  TextEditingController _searchQuery = TextEditingController();
  ProductApi productApi = ProductApi();
  @override
  void initState() {
    super.initState();
    productApi = ProductApi();
    _searchQuery = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                HomeProductPage.ROUTE_NAME,
              );
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchQuery,
                onTap: () {
                  setState(() {
                    productApi.getProductByName(_searchQuery.text);
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search title',
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.search,
              ),
              const SizedBox(height: 40),
              Text(
                'Search Result',
                style: kHeading6,
              ),
              FutureBuilder(
                  future: productApi.getProductByName(_searchQuery.text),
                  builder: (context, snapshot) {
                    final List<ProductsModel>? products;
                    products = snapshot.data;
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error.toString()}'),
                      );
                    } else if (snapshot.hasData) {
                      if (products!.isEmpty) {
                        return Text('product not found');
                      }
                      return ListTile(
                        leading: Image.asset('${products[0].productImageUrl}'),
                        title: Text('${products[0].productName}'),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailPage.ROUTE_NAME,
                            arguments: products![0].id,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
