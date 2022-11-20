import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/tvseries.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';

class GetTopRatedTVSeries {
  final TVSeriesRepository repository;
  GetTopRatedTVSeries(this.repository);
  Future<Either<Failure, List<TVSeries>>> execute() {
    return repository.getTopRatedTVSeries();
  }
}
