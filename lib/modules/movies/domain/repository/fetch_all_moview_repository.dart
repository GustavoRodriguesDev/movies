import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../dto/pagination_movie_dto.dart';
import '../entities/list_movies_entity.dart';

typedef ReturnFetchMovies = Future<Either<Failure, ListMovieEntity>>;

abstract class IFetchAllMoviesRepository {
  ReturnFetchMovies get(PaginationMovieDto page);
}
