import 'package:cached_network_image/cached_network_image.dart';
import 'package:paktani_mobile/common/constants.dart';
import 'package:paktani_mobile/domain/entities/movie.dart';
import 'package:paktani_mobile/presentation/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';

class MovieGridList extends StatelessWidget {
  final List<Movie> movies;
  MovieGridList(this.movies);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
          
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
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
                        imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Text(
                    movie.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SafeArea(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.location_on, size: 20,),
                      Text(
                        movie.releaseDate.toString(),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ]),
                  ),
               
                Text(
                  movie.overview.toString(),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                ],
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}

