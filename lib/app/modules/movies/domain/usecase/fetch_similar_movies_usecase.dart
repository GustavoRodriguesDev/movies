import '../repository/movies_repository.dart';
import '../types/type_movies.dart';

abstract class IFetchSimilarMoviesUsecase {
  ReturnFetchMovies call(int movieId);
}

class FetchSimilarMoviesUsecase implements IFetchSimilarMoviesUsecase {
  final IMoviesRepository repository;

  const FetchSimilarMoviesUsecase(this.repository);
  @override
  ReturnFetchMovies call(int movieId) async {
    return await repository.getSimilarMovies(movieId);
  }
}
