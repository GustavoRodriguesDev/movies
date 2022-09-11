import 'package:dartz/dartz.dart';
import 'package:movies/core/error/errors.dart';
import 'package:movies/modules/movies/domain/dto/paran_search_movie_dto.dart';
import 'package:movies/modules/movies/domain/dto/pagination_movie_dto.dart';
import 'package:movies/modules/movies/domain/repository/movies_repository.dart';

import '../datasource/movies_datasource.dart';

class MoviesRepository implements IMoviesRepository {
  final IMoviesDatasource datasource;

  MoviesRepository(this.datasource);
  @override
  ReturnFetchMovies getAllMovies(PaginationMovieDto page) async {
    try {
      final response = await datasource.getAllMovies(page);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  ReturnSearchMovies searchMovies(ParanSearchMovieDto paran) async {
    try {
      final response = await datasource.searchMovies(paran);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
