import 'package:flutter/material.dart';

import '../../../../cast/interactor/service/i_cast_repository.dart';
import '../../../../cast/interactor/state/cast_state.dart';

class CastMovieStore extends ValueNotifier<CastState> {
  final ICastRepository actoresMovies;

  CastMovieStore(this.actoresMovies) : super(InitCastState());

  Future<void> fetchAllActors(int movieId) async {
    value = LoadingCastState();
    value = await actoresMovies.getAllActores(movieId);
  }
}
