import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../dto/paran_search_movie_dto.dart';
import '../repository/movies_repository.dart';
import '../types/type_movies.dart';

abstract class ISearchMovie {
  ReturnFetchMovies call(ParanSearchMovieDto paran);
}

class SearchMovie implements ISearchMovie {
  final IMoviesRepository repository;

  SearchMovie(this.repository);
  @override
  ReturnFetchMovies call(ParanSearchMovieDto paran) async {
    if (paran.searchParan.isEmpty) {
      return Left(DomainError(message: 'Deve ser digitado um nome de filme para ser buscado'));
    }
    return await repository.searchMovies(paran);
  }
}
