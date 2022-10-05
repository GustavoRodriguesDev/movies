import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/modules/movies/domain/dto/pagination_movie_dto.dart';
import 'package:movies/app/modules/movies/domain/entities/movie_entity.dart';
import 'package:movies/app/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies/app/modules/movies/domain/usecase/fetch_all_movies_usecase.dart';

class MoviesRepositoryMock extends Mock implements IMoviesRepository {}

void main() {
  late IMoviesRepository repository;
  late IFetchAllMoviesUsecase usecase;

  setUpAll(() {
    repository = MoviesRepositoryMock();
    usecase = FetchAllMoviesUsecase(repository);
  });

  PaginationMovieDto page = const PaginationMovieDto();


  test('Deve retornar uma lista de MoviesEntity quando o metodo for chamado', () async {
    when(() => repository.getAllMovies(page)).thenAnswer((_) async =>const Right([]));

    final response = await usecase(page);

    expect(response.isRight(), true);
    expect(response.fold(id, id), isA<List<MovieEntity>>());
    verify(() => repository.getAllMovies(page)).called(1);
  });
  test('Deve retornar uma Failure quando o metodo for chamado', () async {
    when(() => repository.getAllMovies(page)).thenAnswer((_) async => Left(Failure(message: '')));

    final response = await usecase(page);

    expect(response.isLeft(), true);
    expect(response.fold(id, id), isA<Failure>());
    verify(() => repository.getAllMovies(page)).called(1);
  });

  test('Deve retornar uma DomainError quando o metodo for chamado', () async {
    final response = await usecase(const PaginationMovieDto(page: 0));

    expect(response.isLeft(), true);
    expect(response.fold(id, id), isA<DomainError>());
  });
}
