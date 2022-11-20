import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/tvseries.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';

class GetPopularTVSeries {
  final TVSeriesRepository repository;
  GetPopularTVSeries(this.repository);
  Future<Either<Failure, List<TVSeries>>> execute() {
    return repository.getPopularTVSeries();
  }
}
