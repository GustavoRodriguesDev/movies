import 'package:dartz/dartz.dart';
import '../../../../core/error/errors.dart';
import '../../domain/dto/pagination_movie_dto.dart';
import '../../domain/dto/paran_search_movie_dto.dart';
import '../../domain/repository/movies_repository.dart';
import '../../domain/types/type_movies.dart';
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
  ReturnFetchMovies searchMovies(ParanSearchMovieDto paran) async {
    try {
      final response = await datasource.searchMovies(paran);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
  
  @override
  ReturnFetchActoresMovies getAllActores(int movieId) {
    // TODO: implement getAllActores
    throw UnimplementedError();
  }
}
