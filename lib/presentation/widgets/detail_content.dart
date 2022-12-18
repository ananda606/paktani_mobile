import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/domain/api/product_api.dart';
import 'package:paktani_mobile/domain/model/product_model.dart';
import 'package:paktani_mobile/presentation/widgets/product_list.dart';

class DetailContent extends StatelessWidget {
  final List<ProductsModel> product;

  DetailContent(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    ProductApi productApi = ProductApi();
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          '${product[0].productImageUrl}',
          errorBuilder: (context, error, stackTrace) {
            return Center(child: Icon(Icons.not_accessible));
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product[0].productName,
                              style: kHeading5,
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: product[0].productRating ?? 0,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${product[0].productRating}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  product[0].productLocation,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Description',
                              style: kHeading6,
                            ),
                            Text(
                              product[0].productDescription,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Price',
                              style: kHeading6,
                            ),
                            Text(
                              'Rp. ${product[0].productPrice.toString()}',
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return AlertDialog(
                                        title: Text('Pembelian berhasil'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${product[0].productName}'),
                                            Text(
                                                'Description:\n${product[0].productDescription}'),
                                            Text(
                                                'Location:\n${product[0].productLocation}'),
                                            Text(
                                                'Price:\nRp. ${product[0].productPrice}'),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              child: Text('ok'),
                                            ),
                                          ),
                                        ],
                                      );
                                    }));
                              },
                              child: Text('Beli'),
                            ),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            FutureBuilder(
                                future: productApi.getProduct(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<ProductsModel>? productslist =
                                        snapshot.data;
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ProductList(productslist!),
                                    );
                                  } else {
                                    return Center(
                                      child: Text('empty'),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }
}
