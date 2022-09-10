import 'package:dartz/dartz.dart';

import '../../../../core/error/errors.dart';
import '../dto/pagination_movie_dto.dart';
import '../entities/list_movies_entity.dart';
import '../repository/fetch_all_moview_repository.dart';

typedef ReturnFetchMovies = Future<Either<Failure, ListMovieEntity>>;

abstract class IFetchAllMoviesUsecase {
  ReturnFetchMovies call(PaginationMovieDto page);
}

class FetchAllMoviesUsecase implements IFetchAllMoviesUsecase {
  final IFetchAllMoviesRepository repository;

  const FetchAllMoviesUsecase(this.repository);
  @override
  ReturnFetchMovies call(PaginationMovieDto page) async {
    if (page.page <= 0) {
      return Left(DomainError(message: 'Não foi encontrado uma pagina para buscar os filmes'));
    }
    return await repository.get(page);
  }
}
