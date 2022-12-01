import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/domain/entities/movie_detail.dart';
import 'package:paktani_mobile/domain/repositories/movie_repository.dart';
import 'package:paktani_mobile/common/failure.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
