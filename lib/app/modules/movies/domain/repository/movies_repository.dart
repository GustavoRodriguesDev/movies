import '../dto/pagination_movie_dto.dart';
import '../dto/paran_search_movie_dto.dart';
import '../types/type_movies.dart';

abstract class IMoviesRepository {
  ReturnFetchMovies getAllMovies(PaginationMovieDto page);
  ReturnFetchMovies searchMovies(ParanSearchMovieDto paran);
  ReturnFetchActoresMovies getAllActores(int movieId);
}
