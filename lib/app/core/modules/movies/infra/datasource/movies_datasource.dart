

import '../../../../../modules/movies/domain/dto/pagination_movie_dto.dart';
import '../../../../../modules/movies/domain/dto/paran_search_movie_dto.dart';
import '../../../../../modules/movies/domain/entities/movie_entity.dart';

abstract class IMoviesDatasource {
  Future<List<MovieEntity>> getAllMovies(PaginationMovieDto page);
  Future<List<MovieEntity>> searchMovies(ParanSearchMovieDto paran);
}
