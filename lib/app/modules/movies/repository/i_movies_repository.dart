import '../core/dto/pagination_movie_dto.dart';
import '../core/dto/paran_search_movie_dto.dart';
import '../core/types/type_movies.dart';

abstract class IMoviesRepository {
  ReturnFetchMovies getAllMovies(PaginationMovieDto page);
  ReturnFetchMovies searchMovies(ParanSearchMovieDto paran);
  ReturnFetchMovies getSimilarMovies(int movieId);
}
