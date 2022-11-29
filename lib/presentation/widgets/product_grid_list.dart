import 'package:cached_network_image/cached_network_image.dart';
import 'package:paktani_mobile/common/constants.dart';
//import 'package:paktani_mobile/domain/entities/movie.dart';
import 'package:paktani_mobile/presentation/pages/movie_detail_page.dart';
//import 'package:paktani_mobile/presentation/pages/popular_movies_page.dart';
//import 'package:paktani_mobile/presentation/pages/search_page.dart';
//import 'package:paktani_mobile/presentation/pages/top_rated_movies_page.dart';
//import 'package:paktani_mobile/presentation/provider/movie_list_notifier.dart';
//import 'package:paktani_mobile/common/state_enum.dart';
//import 'package:paktani_mobile/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:paktani_mobile/domain/entities/movie.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
class ProductGridList extends StatelessWidget {
  static const ROUTE_NAME = '/home_movie';
  final List<Movie> movie;
  ProductGridList(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final product = movie[index];
          return Container(
          
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: product.id,
                );
              },
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 200,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: '$BASE_IMAGE_URL${product.posterPath}',
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Text(
                    product.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SafeArea(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.location_on, size: 20,),
                      Text(
                        product.releaseDate.toString(),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ]),
                  ),
               
                Text(
                  product.overview.toString(),
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
