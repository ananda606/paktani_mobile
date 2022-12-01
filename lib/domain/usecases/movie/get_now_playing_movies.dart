import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/domain/entities/movie.dart';
import 'package:paktani_mobile/domain/repositories/movie_repository.dart';
import 'package:paktani_mobile/common/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
