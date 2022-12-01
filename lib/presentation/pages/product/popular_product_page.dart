import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/presentation/provider/product/popular_product_notifier.dart';
import 'package:paktani_mobile/presentation/widgets/product_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularProductsPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-product';

  @override
  _PopularProductsPageState createState() => _PopularProductsPageState();
}

class _PopularProductsPageState extends State<PopularProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<PopularProductsNotifier>(context, listen: false)
           .fetchPopularProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<PopularProductsNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Product = data.movies[index];
                  return ProductCard(Product);
                },
                itemCount: data.movies.length,
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
