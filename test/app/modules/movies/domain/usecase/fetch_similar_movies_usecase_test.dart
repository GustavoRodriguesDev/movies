import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/core/modules/movies/domain/entities/movie_entity.dart';
import 'package:movies/app/core/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies/app/core/modules/movies/domain/usecase/fetch_similar_movies_usecase.dart';

class MoviesRepositoryMock extends Mock implements IMoviesRepository {}

void main() {
  late IMoviesRepository repository;
  late IFetchSimilarMoviesUsecase usecase;

  setUpAll(() {
    repository = MoviesRepositoryMock();
    usecase = FetchSimilarMoviesUsecase(repository);
  });
  group('Fetch movies similars', () {
    test('Deve retornar uma lista de MoviesEntity quando o metodo for chamado', () async {
      when(() => repository.getSimilarMovies(0)).thenAnswer((_) async => const Right([]));

      final response = await usecase(0);

      expect(response.isRight(), true);
      expect(response.fold(id, id), isA<List<MovieEntity>>());
      verify(() => repository.getSimilarMovies(0)).called(1);
    });
    test('Deve retornar uma Failure quando o metodo for chamado', () async {
      when(() => repository.getSimilarMovies(0)).thenAnswer((_) async => Left(Failure(message: '')));

      final response = await usecase(0);

      expect(response.isLeft(), true);
      expect(response.fold(id, id), isA<Failure>());
      verify(() => repository.getSimilarMovies(0)).called(1);
    });
  });
}
