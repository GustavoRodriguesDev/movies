import 'package:dartz/dartz.dart';
import '../../../../../modules/movies/domain/dto/pagination_movie_dto.dart';
import '../../../../../modules/movies/domain/entities/movie_entity.dart';
import '../../../../error/errors.dart';
import '../repository/movies_repository.dart';

typedef ReturnFetchMovies = Future<Either<Failure, List<MovieEntity>>>;

abstract class IFetchAllMoviesUsecase {
  ReturnFetchMovies call(PaginationMovieDto page);
}

class FetchAllMoviesUsecase implements IFetchAllMoviesUsecase {
  final IMoviesRepository repository;

  const FetchAllMoviesUsecase(this.repository);
  @override
  ReturnFetchMovies call(PaginationMovieDto page) async {
    if (page.page <= 0) {
      return Left(DomainError(message: 'Não foi encontrado uma pagina para buscar os filmes'));
    }
    return await repository.getAllMovies(page);
  }
}
