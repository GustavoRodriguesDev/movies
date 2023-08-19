import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/core/modules/movies/domain/dto/paran_search_movie_dto.dart';
import 'package:movies/app/core/modules/movies/domain/entities/movie_entity.dart';
import 'package:movies/app/core/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies/app/core/modules/movies/domain/usecase/search_movie.dart';

class MoviesRepositoryMock extends Mock implements IMoviesRepository {}

void main() {
  late IMoviesRepository repository;
  late ISearchMovieUsecase usecase;
  setUpAll(() {
    repository = MoviesRepositoryMock();
    usecase = SearchMovieUsecase(repository);
  });
  ParanSearchMovieDto dto = const ParanSearchMovieDto(searchParan: 'lord os the rings');
  test('Deve retonar um ListMovieEntity quando o metofo for chamado', () async {
    when(() => repository.searchMovies(dto)).thenAnswer((_) async => const Right([]));
    final response = await usecase(dto);
    expect(response.isRight(), true);
    expect(response.fold(id, id), isA<List<MovieEntity>>());
    verify(() => repository.searchMovies(dto)).called(1);
  });
  test('Deve retornar uma Failure quando o metodo for chamado', () async {
    when(() => repository.searchMovies(dto)).thenAnswer((_) async => Left(Failure(message: '')));

    final response = await usecase(dto);

    expect(response.isLeft(), true);
    expect(response.fold(id, id), isA<Failure>());
    verify(() => repository.searchMovies(dto)).called(1);
  });
  test('Deve retornar uma DomainError quando o metodo for chamado', () async {
    final response = await usecase(const ParanSearchMovieDto());

    expect(response.isLeft(), true);
    expect(response.fold(id, id), isA<DomainError>());
  });
}
