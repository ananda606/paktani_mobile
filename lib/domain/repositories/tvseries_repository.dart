import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/tvseries.dart';
import 'package:paktani_mobile/domain/entities/tvseries_detail.dart';

abstract class TVSeriesRepository {
  Future<Either<Failure, List<TVSeries>>> getOnAirTVSeries();
  Future<Either<Failure, List<TVSeries>>> getPopularTVSeries();
  Future<Either<Failure, List<TVSeries>>> getTopRatedTVSeries();
  Future<Either<Failure, TVSeriesDetail>> getTVSeriesDetail(int id);
  Future<Either<Failure, List<TVSeries>>> getTVSeriesRecommendations(int id);
  Future<Either<Failure, List<TVSeries>>> searchTVSeries(String query);
  Future<Either<Failure, String>> saveWatchlist(TVSeriesDetail tv);
  Future<Either<Failure, String>> removeWatchlist(TVSeriesDetail tv);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, List<TVSeries>>> getWatchlistTVSeries();
}
