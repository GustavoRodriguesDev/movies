// ignore_for_file: unused_catch_clause

import '../../../../constants/movies_api.dart';
import '../../../../error/errors.dart';
import '../../../../service/http_service/http_service.dart';
import '../../domain/dto/pagination_movie_dto.dart';
import '../../domain/dto/paran_search_movie_dto.dart';
import '../../domain/entities/movie_entity.dart';
import '../../infra/datasource/movies_datasource.dart';
import '../mapper/movies_mapper.dart';

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
