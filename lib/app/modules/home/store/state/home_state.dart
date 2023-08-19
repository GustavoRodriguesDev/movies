import 'package:core/core.dart';

import '../../../../shared/modules/movies/domain/entities/movie_entity.dart';

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
