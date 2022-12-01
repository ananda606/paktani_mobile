import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/presentation/provider/product/top_rated_product_notifier.dart';
import 'package:paktani_mobile/presentation/widgets/product_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopRatedProductsPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-product';

  @override
  _TopRatedProductsPageState createState() => _TopRatedProductsPageState();
}

class _TopRatedProductsPageState extends State<TopRatedProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TopRatedProductsNotifier>(context, listen: false)
            .fetchTopRatedProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TopRatedProductsNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = data.movies[index];
                  return ProductCard(movie);
                },
                itemCount: data.movies.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
