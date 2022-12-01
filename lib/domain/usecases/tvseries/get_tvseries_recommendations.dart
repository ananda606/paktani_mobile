import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/tvseries.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';

class GetTVSeriesRecommendations {
  final TVSeriesRepository repository;
  GetTVSeriesRecommendations(this.repository);
  Future<Either<Failure, List<TVSeries>>> execute(int id) {
    return repository.getTVSeriesRecommendations(id);
  }
}
