// ignore_for_file: unused_catch_clause

import 'package:movies/core/error/errors.dart';
import 'package:movies/core/service/http_service/http_service.dart';
import 'package:movies/modules/movies/domain/dto/paran_search_movie_dto.dart';
import 'package:movies/modules/movies/domain/dto/pagination_movie_dto.dart';
import 'package:movies/modules/movies/external/mapper/movies_mapper.dart';
import 'package:movies/modules/movies/infra/datasource/movies_datasource.dart';
import '../../domain/entities/movie_entity.dart';

class MoviesDatasource implements IMoviesDatasource {
  final IHttpService http;

  MoviesDatasource(this.http);
  @override
  Future<List<MovieEntity>> getAllMovies(PaginationMovieDto page) async {
    try {
      final response = await http.get('/movie/popular', queryParameters: {'page': page.page});
      return MoviesMapper.fromJson(response.data['results']);
    } on Failure catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieEntity>> searchMovies(ParanSearchMovieDto paran) async {
    try {
      final response = await http.get('/search/movie', queryParameters: {'query': paran.searchParan});
      return MoviesMapper.fromJson(response.data['results']);
    } on Failure catch (e) {
      rethrow;
    }
  }
}
