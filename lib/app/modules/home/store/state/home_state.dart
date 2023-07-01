import '../../../../core/error/errors.dart';
import '../../../movies/core/model/movie_model.dart';

abstract class HomeState {}

class SuccesHomeState extends HomeState {
  final List<MovieEntity> listMovies;

  SuccesHomeState({required this.listMovies});
}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {
  final Failure error;

  ErrorHomeState(this.error);
}

class EmpityHomeState extends HomeState {}
