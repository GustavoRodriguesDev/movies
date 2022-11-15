import '../../domain/dto/pagination_movie_dto.dart';
import '../../domain/dto/paran_search_movie_dto.dart';

import '../../domain/entities/movie_entity.dart';

abstract class IMoviesDatasource {
  Future<List<MovieEntity>> getAllMovies(PaginationMovieDto page);
  Future<List<MovieEntity>> searchMovies(ParanSearchMovieDto paran);
  Future<List<MovieEntity>> getSimilarMovies(int movieID);
}
