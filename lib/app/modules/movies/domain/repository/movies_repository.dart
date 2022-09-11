import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../dto/pagination_movie_dto.dart';
import '../dto/paran_search_movie_dto.dart';
import '../entities/movie_entity.dart';


typedef ReturnFetchMovies = Future<Either<Failure, List<MovieEntity>>>;
typedef ReturnSearchMovies = Future<Either<Failure, List<MovieEntity>>>;

abstract class IMoviesRepository {
  ReturnFetchMovies getAllMovies(PaginationMovieDto page);
  ReturnSearchMovies searchMovies(ParanSearchMovieDto paran);
}
