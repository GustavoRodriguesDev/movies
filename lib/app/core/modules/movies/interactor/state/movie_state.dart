import '../../../../error/errors.dart';
import '../model/movie_model.dart';

sealed class MovieState {}

class SuccesMovieState extends MovieState {
  final List<MovieModel> listMovies;

  SuccesMovieState({required this.listMovies});
}

class LoadingMovieState extends MovieState {}

class ErrorMovieState extends MovieState {
  final Failure error;

  ErrorMovieState({required this.error});
}

class EmptyMovieState extends MovieState {}
