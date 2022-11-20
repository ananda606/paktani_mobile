import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/tvseries_detail.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';

class RemoveWatchlistTVSeries {
  final TVSeriesRepository repository;
  RemoveWatchlistTVSeries(this.repository);
  Future<Either<Failure, String>> execute(TVSeriesDetail id) {
    return repository.removeWatchlist(id);
  }
}
