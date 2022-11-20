import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/common/failure.dart';
import 'package:paktani_mobile/domain/entities/tvseries_detail.dart';
import 'package:paktani_mobile/domain/repositories/tvseries_repository.dart';

class GetTVSeriesDetail {
  final TVSeriesRepository repository;
  GetTVSeriesDetail(this.repository);
  Future<Either<Failure, TVSeriesDetail>> execute(int id) {
    return repository.getTVSeriesDetail(id);
  }
}
