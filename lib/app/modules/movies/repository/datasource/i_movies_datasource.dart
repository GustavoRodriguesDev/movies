import '../../core/dto/pagination_movie_dto.dart';
import '../../core/dto/paran_search_movie_dto.dart';
import '../../core/model/movie_model.dart';

abstract class IMoviesDatasource {
  Future<List<MovieEntity>> getAllMovies(PaginationMovieDto page);
  Future<List<MovieEntity>> searchMovies(ParanSearchMovieDto paran);
  Future<List<MovieEntity>> getSimilarMovies(int movieID);
}
