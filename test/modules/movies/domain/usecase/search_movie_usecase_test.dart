import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/core/error/errors.dart';
import 'package:movies/modules/movies/domain/dto/paran_search_movie_dto.dart';
import 'package:movies/modules/movies/domain/entities/list_movies_entity.dart';
import 'package:movies/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies/modules/movies/domain/usecase/search_movie_usecase.dart';

class MoviesRepositoryMock extends Mock implements IMoviesRepository {}

void main() {
  late IMoviesRepository repository;
  late ISearchMovie usecase;
  setUpAll(() {
    repository = MoviesRepositoryMock();
    usecase = SearchMovie(repository);
  });
  ParanSearchMovieDto dto = const ParanSearchMovieDto(searchParan: 'lord os the rings');
  ListMovieEntity entity = const ListMovieEntity();
  test('Deve retonar um ListMovieEntity quando o metofo for chamado', () async {
    when(() => repository.searchMovies(dto)).thenAnswer((_) async => Right(entity));
    final response = await usecase(dto);
    expect(response.isRight(), true);
    expect(response.fold(id, id), isA<ListMovieEntity>());
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
