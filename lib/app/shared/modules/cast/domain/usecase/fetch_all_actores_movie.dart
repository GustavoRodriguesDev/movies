import '../repository/cast_repository.dart';
import '../types/types_cast.dart';

abstract class IFetchAllActoresMovies {
  ReturnFetchActoresMovies call(int movieId);
}

class FetchAllActoresMovies implements IFetchAllActoresMovies {
  final ICastRepository repository;

  FetchAllActoresMovies(this.repository);
  @override
  ReturnFetchActoresMovies call(int movieId) async {
    final response = await repository.getAllActores(movieId);
    return response;
  }
}
