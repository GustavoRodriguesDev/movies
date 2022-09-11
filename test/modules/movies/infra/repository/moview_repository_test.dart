import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/core/error/errors.dart';
import 'package:movies/modules/movies/domain/dto/pagination_movie_dto.dart';
import 'package:movies/modules/movies/domain/dto/paran_search_movie_dto.dart';
import 'package:movies/modules/movies/domain/entities/list_movies_entity.dart';
import 'package:movies/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies/modules/movies/infra/datasource/movies_datasource.dart';
import 'package:movies/modules/movies/infra/repository/moview_repository.dart';

class MoviesDatasourceMock extends Mock implements IMoviesDatasource {}

void main() {
  late IMoviesDatasource datasource;
  late IMoviesRepository repository;

  setUpAll(() {
    datasource = MoviesDatasourceMock();
    repository = MoviesRepository(datasource);
  });
  PaginationMovieDto page = const PaginationMovieDto();
  ParanSearchMovieDto dto = const ParanSearchMovieDto(searchParan: 'lord os the rings');
  ListMovieEntity entity = const ListMovieEntity();
  test('Deve retornar um ListMovieEntity quando o metodo for chamado getAllMovies for chamado', () async {
    when(() => datasource.getAllMovies(page)).thenAnswer((_) async => entity);
    final response = await repository.getAllMovies(page);

    expect(response.isRight(), true);
    expect(response.fold((l) => l, (r) => r), isA<ListMovieEntity>());
    verify(() => datasource.getAllMovies(page)).called(1);
  });

  test('Deve retornar uma Failure quando o metodo for chamado getAllMovies for chamado', () async {
    when(() => datasource.getAllMovies(page)).thenThrow(Failure(message: ''));
    final response = await repository.getAllMovies(page);

    expect(response.isLeft(), true);
    expect(response.fold((l) => l, (r) => r), isA<Failure>());
    verify(() => datasource.getAllMovies(page)).called(1);
  });
  test('Deve retornar um ListMovieEntity quando o metodo for chamado searchMovies for chamado', () async {
    when(() => datasource.searchMovies(dto)).thenAnswer((_) async => entity);
    final response = await repository.searchMovies(dto);

    expect(response.isRight(), true);
    expect(response.fold((l) => l, (r) => r), isA<ListMovieEntity>());
    verify(() => datasource.searchMovies(dto)).called(1);
  });

  test('Deve retornar uma Failure quando o metodo for chamado searchMovies for chamado', () async {
    when(() => datasource.searchMovies(dto)).thenThrow(Failure(message: ''));
    final response = await repository.searchMovies(dto);

    expect(response.isLeft(), true);
    expect(response.fold((l) => l, (r) => r), isA<Failure>());
    verify(() => datasource.searchMovies(dto)).called(1);
  });
}
