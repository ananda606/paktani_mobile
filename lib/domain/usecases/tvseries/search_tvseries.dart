import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/tvseries.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';

class SearchTVSeries {
  final TVSeriesRepository repository;
  SearchTVSeries(this.repository);
  Future<Either<Failure, List<TVSeries>>> execute(String query) {
    return repository.searchTVSeries(query);
  }
}
