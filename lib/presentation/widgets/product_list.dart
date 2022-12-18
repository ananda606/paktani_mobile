import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/product/product_detail_page.dart';

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
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ProductDetailPage.ROUTE_NAME,
                    arguments: product.id,
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset('${product.productImageUrl}'),
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
