import 'package:paktani_mobile/data/datasources/db/database_helper.dart';
import 'package:paktani_mobile/data/datasources/db/database_helper_product.dart';
import 'package:paktani_mobile/data/datasources/db/database_helper_tvseries.dart';
import 'package:paktani_mobile/data/datasources/movie_local_data_source.dart';
import 'package:paktani_mobile/data/datasources/movie_remote_data_source.dart';
import 'package:paktani_mobile/data/datasources/product/product_local_data_source.dart';
import 'package:paktani_mobile/data/datasources/product/product_remote_data_source.dart';
import 'package:paktani_mobile/data/datasources/tvseries_local_data_source.dart';
import 'package:paktani_mobile/data/datasources/tvseries_remote_data_source.dart';
import 'package:paktani_mobile/data/repositories/movie_repository_impl.dart';
import 'package:paktani_mobile/data/repositories/product_repository_impl.dart';
import 'package:paktani_mobile/data/repositories/tvseries_repository_impl.dart';
import 'package:paktani_mobile/domain/repositories/movie_repository.dart';
import 'package:paktani_mobile/domain/repositories/product_repository.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';
import 'package:paktani_mobile/domain/usecases/movie/get_movie_detail.dart';
import 'package:paktani_mobile/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:paktani_mobile/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/get_onair_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/movie/get_popular_movies.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/get_popular_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/get_top_rated_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/get_tvseries_detail.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/get_tvseries_recommendations.dart';
import 'package:paktani_mobile/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:paktani_mobile/domain/usecases/movie/get_watchlist_status.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/get_watchlist_tvseries_status.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/get_watchlist_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_product_detail.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_recommendation_product.dart';
import 'package:paktani_mobile/domain/usecases/product/get/get_wishlist_product.dart';
import 'package:paktani_mobile/domain/usecases/product/post/save_wishlist_product.dart';
import 'package:paktani_mobile/domain/usecases/movie/remove_watchlist.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/remove_watchlist_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/movie/save_watchlist.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/save_watchlist_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/movie/search_movies.dart';
import 'package:paktani_mobile/domain/usecases/tvseries/search_tvseries.dart';
import 'package:paktani_mobile/presentation/provider/movie/movie_detail_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/movie_list_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/movie_search_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/onair_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/popular_movies_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/popular_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/provider/product/product_detail_notifier.dart';
import 'package:paktani_mobile/presentation/provider/product/product_list_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/top_rated_movies_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/top_rated_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/tvseries_detail_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/tvseries_list_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/tvseries_search_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries/watchlist_tvseries_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
  //product
  locator.registerFactory(
    () => ProductListNotifier(
      getTopRatedProducts: locator(),
      getProductDetail: locator(),
      getPopularProducts: locator(),
    ),
  );
  locator.registerFactory(
    () => ProductDetailNotifier(
      getProductDetail: locator(),
      getProductRecommendations: locator(),
      getWishlistStatus: locator(),
      saveWishlist: locator(),
      removeWishlist: locator(),
    ),
  );

  locator.registerFactory(
    () => OnAirTVSeriesNotifier(getOnAirTVSeries: locator()),
  );
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesListNotifier(
      getOnAirTVSeries: locator(),
      getPopularTVSeries: locator(),
      getTopRatedTVSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesDetailNotifier(
      getTVSeriesDetail: locator(),
      getTVSeriesRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesSearchNotifier(
      searchTVSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTVSeriesNotifier(
      locator(),
    ),
  );

  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTVSeriesNotifier(
      getTopRatedTVSeries: locator(),
    ),
  );
  

  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistTVSeriesNotifier(
      getWatchlistTVSeries: locator(),
    ),
  );

  // use case
  //products
  locator.registerLazySingleton(() => GetProductDetail(locator()));
  locator.registerLazySingleton(() => GetProductRecommendations(locator()));
  locator.registerLazySingleton(
    () => SaveWishlist(locator()),
  );

  //movies
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  //tvseries
  locator.registerLazySingleton(() => GetOnAirTVSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTVSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTVSeries(locator()));
  locator.registerLazySingleton(() => GetTVSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTVSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTVSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTVSeriesStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTVSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTVSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTVSeries(locator()));

  // repository
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TVSeriesRepository>(
    () => TVSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  // data sources
  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(databaseHelperProduct: locator()),
  );

  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TVSeriesRemoteDataSource>(
      () => TVSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TVSeriesLocalDataSource>(
      () => TVSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
   locator.registerLazySingleton<DatabaseHelperProduct>(
      () => DatabaseHelperProduct());
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<DatabaseHelperTVSeries>(
      () => DatabaseHelperTVSeries());
 

  // external
  locator.registerLazySingleton(() => http.Client());
}
