import '../dto/pagination_movie_dto.dart';
import '../dto/paran_search_movie_dto.dart';
import '../types/type_movies.dart';

abstract class IMoviesService {
  ReturnFetchMovies getAllMovies(PaginationMovieDto page);
  ReturnFetchMovies searchMovies(ParanSearchMovieDto paran);
  ReturnFetchMovies getSimilarMovies(int movieId);
}
