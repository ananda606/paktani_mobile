
import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/product/product_detail_page.dart';
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
