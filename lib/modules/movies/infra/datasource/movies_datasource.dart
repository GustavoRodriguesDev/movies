import '../../domain/dto/pagination_movie_dto.dart';
import '../../domain/dto/paran_search_movie_dto.dart';
import '../../domain/entities/list_movies_entity.dart';

abstract class IMoviesDatasource {
  Future<ListMovieEntity> getAllMovies(PaginationMovieDto page);
  Future<ListMovieEntity> searchMovies(ParanSearchMovieDto paran);
}
