import 'package:flutter/material.dart';

import '../../../../../core/modules/cast/interactor/service/i_cast_repository.dart';
import '../../../../../core/modules/cast/interactor/state/cast_state.dart';

class CastMovieStore extends ValueNotifier<CastState> {
  final ICastService actoresMovies;

  CastMovieStore(this.actoresMovies) : super(InitCastState());

  Future<void> fetchAllActors(int movieId) async {
    value = LoadingCastState();
    value = await actoresMovies.getAllActores(movieId);
  }
}
