import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/tvseries.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';

class GetOnAirTVSeries {
  final TVSeriesRepository repository;
  GetOnAirTVSeries(this.repository);
  Future<Either<Failure, List<TVSeries>>> execute() {
    return repository.getOnAirTVSeries();
  }
}
