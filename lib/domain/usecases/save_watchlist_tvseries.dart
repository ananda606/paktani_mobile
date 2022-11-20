import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/tvseries_detail.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';

class SaveWatchlistTVSeries {
  final TVSeriesRepository repository;
  SaveWatchlistTVSeries(this.repository);
  Future<Either<Failure, String>> execute(TVSeriesDetail id) {
    return repository.saveWatchlist(id);
  }
}
