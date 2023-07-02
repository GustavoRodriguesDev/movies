import 'package:movies/app/modules/movies/interactor/state/movie_state.dart';

import '../../../../core/constants/movies_api.dart';
import '../../../../core/error/errors.dart';
import '../../../../core/service/http_service/http_service.dart';
import '../../interactor/dto/pagination_movie_dto.dart';
import '../../interactor/dto/paran_search_movie_dto.dart';
import '../../interactor/service/i_movies_repository.dart';
import '../../interactor/types/type_movies.dart';
import '../adpter/movies_mapper.dart';

class MoviesRepository implements IMoviesRepository {
  final IHttpService http;

  MoviesRepository(this.http);
  @override
  ReturnFetchMovies getAllMovies(PaginationMovieDto page) async {
    try {
      final response = await http
          .get(ApiConstants.nowPlaying, queryParameters: {'page': page.page});
      final listMovie = MoviesMapper.fromJson(response.data['results']);
      return SuccesMovieState(listMovies: listMovie);
    } on Failure catch (e) {
      return ErrorMovieState(error: e);
    }
  }

  @override
  ReturnFetchMovies searchMovies(ParanSearchMovieDto paran) async {
    try {
      final response = await http.get(ApiConstants.searchMovie,
          queryParameters: {'query': paran.searchParan});
      final listMovie = MoviesMapper.fromJson(response.data['results']);
      return SuccesMovieState(listMovies: listMovie);
    } on Failure catch (e) {
      return ErrorMovieState(error: e);
    }
  }

  @override
  ReturnFetchMovies getSimilarMovies(int movieId) async {
    try {
      final response = await http.get(
        '${ApiConstants.movie}/$movieId${ApiConstants.similar}',
      );
      final listMovie = MoviesMapper.fromJson(response.data['results']);
      return SuccesMovieState(listMovies: listMovie);
    } on Failure catch (e) {
      return ErrorMovieState(error: e);
    }
  }
}
