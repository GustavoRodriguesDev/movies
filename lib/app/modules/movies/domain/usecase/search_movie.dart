import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../dto/paran_search_movie_dto.dart';
import '../entities/movie_entity.dart';
import '../repository/movies_repository.dart';

typedef ReturnSearchMovies = Future<Either<Failure, List<MovieEntity>>>;

abstract class ISearchMovie {
  ReturnSearchMovies call(ParanSearchMovieDto paran);
}

class SearchMovie implements ISearchMovie {
  final IMoviesRepository repository;

  SearchMovie(this.repository);
  @override
  ReturnSearchMovies call(ParanSearchMovieDto paran) async {
    if (paran.searchParan.isEmpty) {
      return Left(DomainError(message: 'Deve ser digitado um nome de filme para ser buscado'));
    }
    return await repository.searchMovies(paran);
  }
}
