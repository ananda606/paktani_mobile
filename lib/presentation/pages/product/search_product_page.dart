import 'package:flutter/material.dart';
import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/presentation/pages/product/home_product_page.dart';
import 'package:paktani_mobile/presentation/widgets/custom_drawer.dart';

class SearchProductPage extends StatelessWidget {
  static const ROUTE_NAME = '/search_page';
  const SearchProductPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
              
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
          
          ],
        ),
      ),
    );
  }
}
