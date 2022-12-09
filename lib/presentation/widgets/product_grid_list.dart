import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/pages/product/product_detail_page.dart';

class ProductGridList extends StatelessWidget {
  static const ROUTE_NAME = '/home_product';
  final List<ProductsModel> movie;
  const ProductGridList(this.movie, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final product = movie[index];
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      width: 200,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://i.guim.co.uk/img/media/63de40b99577af9b867a9c57555a432632ba760b/0_266_5616_3370/master/5616.jpg?width=620&quality=45&dpr=2&s=none',
                       
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Text(
                    product.productName.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SafeArea(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                      Text(
                        product.productDescription.toString(),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ]),
                  ),
                  Text(
                    product.productRating.toString(),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: movie.length,
      ),
    );
  }
}
