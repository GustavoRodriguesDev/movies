import '../../../../core/error/errors.dart';
import '../../../../core/modules/movies/interactor/model/movie_model.dart';

abstract class SearchState {}

class SuccessSearchState implements SearchState {
  final List<MovieModel> listMovies;

  SuccessSearchState({required this.listMovies});
}

class ErrorSearchState implements SearchState {
  final Failure error;

  ErrorSearchState(this.error);
}

class LoadingSearchState implements SearchState {}

class InitSearchState implements SearchState {}

class EmptySearchState implements SearchState {}
