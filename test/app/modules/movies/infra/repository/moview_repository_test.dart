import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/core/error/errors.dart';
import 'package:movies/app/core/modules/movies/domain/dto/pagination_movie_dto.dart';
import 'package:movies/app/core/modules/movies/domain/dto/paran_search_movie_dto.dart';
import 'package:movies/app/core/modules/movies/domain/entities/movie_entity.dart';
import 'package:movies/app/core/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies/app/core/modules/movies/infra/datasource/movies_datasource.dart';
import 'package:movies/app/core/modules/movies/infra/repository/moview_repository.dart';

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

  group('teste metodo getAllMovies', () {
    test('Deve retornar um ListMovieEntity quando o metodo for chamado getAllMovies for chamado', () async {
      when(() => datasource.getAllMovies(page)).thenAnswer((_) async => []);
      final response = await repository.getAllMovies(page);

      expect(response.isRight(), true);
      expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
      verify(() => datasource.getAllMovies(page)).called(1);
    });

    test('Deve retornar uma Failure quando o metodo for chamado getAllMovies for chamado', () async {
      when(() => datasource.getAllMovies(page)).thenThrow(Failure(message: ''));
      final response = await repository.getAllMovies(page);

      expect(response.isLeft(), true);
      expect(response.fold((l) => l, (r) => r), isA<Failure>());
      verify(() => datasource.getAllMovies(page)).called(1);
    });
  });

  group('teste metodo searchMovies', () {
    test('Deve retornar um ListMovieEntity quando o metodo for chamado searchMovies for chamado', () async {
      when(() => datasource.searchMovies(dto)).thenAnswer((_) async => []);
      final response = await repository.searchMovies(dto);

      expect(response.isRight(), true);
      expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
      verify(() => datasource.searchMovies(dto)).called(1);
    });

    test('Deve retornar uma Failure quando o metodo for chamado searchMovies for chamado', () async {
      when(() => datasource.searchMovies(dto)).thenThrow(Failure(message: ''));
      final response = await repository.searchMovies(dto);

      expect(response.isLeft(), true);
      expect(response.fold((l) => l, (r) => r), isA<Failure>());
      verify(() => datasource.searchMovies(dto)).called(1);
    });
  });
  group('teste metodo getSimilarMovies', () {
    test('Deve retornar um ListMovieEntity quando o metodo for chamado getSimilarMovies for chamado', () async {
      when(() => datasource.getSimilarMovies(0)).thenAnswer((_) async => []);
      final response = await repository.getSimilarMovies(0);

      expect(response.isRight(), true);
      expect(response.fold((l) => l, (r) => r), isA<List<MovieEntity>>());
      verify(() => datasource.getSimilarMovies(0)).called(1);
    });

    test('Deve retornar uma Failure quando o metodo for chamado getSimilarMovies for chamado', () async {
      when(() => datasource.getSimilarMovies(0)).thenThrow(Failure(message: ''));
      final response = await repository.getSimilarMovies(0);

      expect(response.isLeft(), true);
      expect(response.fold((l) => l, (r) => r), isA<Failure>());
      verify(() => datasource.getSimilarMovies(0)).called(1);
    });
  });
}
