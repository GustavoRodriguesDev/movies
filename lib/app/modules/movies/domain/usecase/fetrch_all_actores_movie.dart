import 'package:movies/app/core/widgets/componentes/star_rating.dart';

import '../repository/movies_repository.dart';
import '../types/type_movies.dart';

abstract class IFetchAllActoresMovies {
  ReturnFetchActoresMovies call(int movieId);
}

class FetchAllActoresMovies implements IFetchAllActoresMovies {
  final IMoviesRepository repository;

  FetchAllActoresMovies(this.repository);
  @override
  ReturnFetchActoresMovies call(int movieId) async {
    final response = await repository.getAllActores(movieId);
    throw response;
  }
}
