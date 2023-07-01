// ignore_for_file: unused_catch_clause

import '../../../../core/constants/movies_api.dart';
import '../../../../core/error/errors.dart';
import '../../../../core/service/http_service/http_service.dart';
import '../../core/dto/pagination_movie_dto.dart';
import '../../core/dto/paran_search_movie_dto.dart';
import '../../core/model/movie_model.dart';
import 'i_movies_datasource.dart';
import 'mapper/movies_mapper.dart';

class MoviesDatasource implements IMoviesDatasource {
  final IHttpService http;

  MoviesDatasource(this.http);
  @override
  Future<List<MovieEntity>> getAllMovies(PaginationMovieDto page) async {
    try {
      final response = await http.get(ApiConstants.nowPlaying, queryParameters: {'page': page.page});
      return MoviesMapper.fromJson(response.data['results']);
    } on Failure catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieEntity>> searchMovies(ParanSearchMovieDto paran) async {
    try {
      final response = await http.get(ApiConstants.searchMovie, queryParameters: {'query': paran.searchParan});
      return MoviesMapper.fromJson(response.data['results']);
    } on Failure catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieEntity>> getSimilarMovies(int movieID) async {
    try {
      final response = await http.get(
        '${ApiConstants.movie}/$movieID${ApiConstants.similar}',
      );
      return MoviesMapper.fromJson(response.data['results']);
    } on Failure catch (e) {
      rethrow;
    }
  }
}
