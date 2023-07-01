import 'package:flutter/cupertino.dart';
import 'package:movies/app/core/error/errors.dart';

import '../../cast/core/model/cast_model.dart';
import '../../cast/repository/i_cast_repository.dart';
import '../../movies/core/model/movie_model.dart';
import '../../movies/repository/i_movies_repository.dart';
import 'state/state_details_movies.dart';

class DetaisMoviesStore extends ValueNotifier<DetailsMoviesState> {
  final ICastRepository actoresMovies;
  final IMoviesRepository moviesRepository;
  DetaisMoviesStore({
    required this.actoresMovies,
    required this.moviesRepository,
  }) : super(EmpityDetailsMoviesState());

  Future<void> initalDetails(int movieId) async {
    value = LoadingDetailsMoviesState();
    try {
      List<CastEntity> casts = await _fetchAllActors(movieId);
      List<MovieEntity> movies = await _fetchSimilarMovies(movieId);
      value = SuccessDetailsMoviesState(listCast: casts, movieEntity: movies);
    } on Failure catch (error) {
      value = ErrorDetailsMoviesState(error);
    }
  }

  Future<List<CastEntity>> _fetchAllActors(int movieId) async {
    final response = await actoresMovies.getAllActores(movieId);

    return response.fold(
      (error) {
        throw error;
      },
      (casts) {
        return casts;
      },
    );
  }

  Future<List<MovieEntity>> _fetchSimilarMovies(int movieId) async {
    final response = await moviesRepository.getSimilarMovies(movieId);
    return response.fold(
      (error) {
        throw error;
      },
      (movie) {
        return movie;
      },
    );
  }
}
