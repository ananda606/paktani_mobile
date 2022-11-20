import 'package:paktani_mobile/data/datasources/db/database_helper.dart';
import 'package:paktani_mobile/data/datasources/db/database_helper_tvseries.dart';
import 'package:paktani_mobile/data/datasources/movie_local_data_source.dart';
import 'package:paktani_mobile/data/datasources/movie_remote_data_source.dart';
import 'package:paktani_mobile/data/datasources/tvseries_local_data_source.dart';
import 'package:paktani_mobile/data/datasources/tvseries_remote_data_source.dart';
import 'package:paktani_mobile/data/repositories/movie_repository_impl.dart';
import 'package:paktani_mobile/data/repositories/tvseries_repository_impl.dart';
import 'package:paktani_mobile/domain/repositories/movie_repository.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';
import 'package:paktani_mobile/domain/usecases/get_movie_detail.dart';
import 'package:paktani_mobile/domain/usecases/get_movie_recommendations.dart';
import 'package:paktani_mobile/domain/usecases/get_now_playing_movies.dart';
import 'package:paktani_mobile/domain/usecases/get_onair_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/get_popular_movies.dart';
import 'package:paktani_mobile/domain/usecases/get_popular_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/get_top_rated_movies.dart';
import 'package:paktani_mobile/domain/usecases/get_top_rated_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/get_tvseries_detail.dart';
import 'package:paktani_mobile/domain/usecases/get_tvseries_recommendations.dart';
import 'package:paktani_mobile/domain/usecases/get_watchlist_movies.dart';
import 'package:paktani_mobile/domain/usecases/get_watchlist_status.dart';
import 'package:paktani_mobile/domain/usecases/get_watchlist_tvseries_status.dart';
import 'package:paktani_mobile/domain/usecases/get_watchlist_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/remove_watchlist.dart';
import 'package:paktani_mobile/domain/usecases/remove_watchlist_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/save_watchlist.dart';
import 'package:paktani_mobile/domain/usecases/save_watchlist_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/search_movies.dart';
import 'package:paktani_mobile/domain/usecases/search_tvseries.dart';
import 'package:paktani_mobile/presentation/provider/movie_detail_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie_list_notifier.dart';
import 'package:paktani_mobile/presentation/provider/movie_search_notifier.dart';
import 'package:paktani_mobile/presentation/provider/onair_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/provider/popular_movies_notifier.dart';
import 'package:paktani_mobile/presentation/provider/popular_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/provider/top_rated_movies_notifier.dart';
import 'package:paktani_mobile/presentation/provider/top_rated_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries_detail_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries_list_notifier.dart';
import 'package:paktani_mobile/presentation/provider/tvseries_search_notifier.dart';
import 'package:paktani_mobile/presentation/provider/watchlist_movie_notifier.dart';
import 'package:paktani_mobile/presentation/provider/watchlist_tvseries_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
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
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TVSeriesRemoteDataSource>(
      () => TVSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TVSeriesLocalDataSource>(
      () => TVSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<DatabaseHelperTVSeries>(
      () => DatabaseHelperTVSeries());

  // external
  locator.registerLazySingleton(() => http.Client());
}
