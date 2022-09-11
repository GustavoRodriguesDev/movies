import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../dto/pagination_movie_dto.dart';
import '../dto/paran_search_movie_dto.dart';
import '../entities/list_movies_entity.dart';

typedef ReturnFetchMovies = Future<Either<Failure, ListMovieEntity>>;
typedef ReturnSearchMovies = Future<Either<Failure, ListMovieEntity>>;

abstract class IMoviesRepository {
  ReturnFetchMovies getAllMovies(PaginationMovieDto page);
  ReturnSearchMovies searchMovies(ParanSearchMovieDto paran);
}
