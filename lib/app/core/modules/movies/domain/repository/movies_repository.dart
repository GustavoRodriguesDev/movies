import 'package:dartz/dartz.dart';

import '../../../../../modules/movies/domain/dto/pagination_movie_dto.dart';
import '../../../../../modules/movies/domain/dto/paran_search_movie_dto.dart';
import '../../../../../modules/movies/domain/entities/movie_entity.dart';
import '../../../../error/errors.dart';


typedef ReturnFetchMovies = Future<Either<Failure, List<MovieEntity>>>;
typedef ReturnSearchMovies = Future<Either<Failure, List<MovieEntity>>>;

abstract class IMoviesRepository {
  ReturnFetchMovies getAllMovies(PaginationMovieDto page);
  ReturnSearchMovies searchMovies(ParanSearchMovieDto paran);
}
