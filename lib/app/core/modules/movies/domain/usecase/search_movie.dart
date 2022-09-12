import 'package:dartz/dartz.dart';
import '../../../../../modules/movies/domain/dto/paran_search_movie_dto.dart';
import '../../../../../modules/movies/domain/entities/movie_entity.dart';
import '../../../../error/errors.dart';
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
