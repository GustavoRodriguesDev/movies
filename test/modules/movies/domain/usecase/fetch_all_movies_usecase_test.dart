import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/modules/movies/domain/dto/pagination_movie_dto.dart';
import 'package:movies/modules/movies/domain/entities/list_movies_entity.dart';
import 'package:movies/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies/modules/movies/domain/usecase/fetch_all_movies_usecase.dart';

class MoviesRepositoryMock extends Mock implements IMoviesRepository {}

void main() {
  late IMoviesRepository repository;
  late IFetchAllMoviesUsecase usecase;

  setUpAll(() {
    repository = MoviesRepositoryMock();
    usecase = FetchAllMoviesUsecase(repository);
  });

  PaginationMovieDto page = const PaginationMovieDto();
  ListMovieEntity entity = const ListMovieEntity();

  test('Deve retornar uma lista de MoviesEntity quando o metood for chamado', () async {
    when(() => repository.getAllMovies(page)).thenAnswer((_) async => Right(entity));

    final response = await usecase(page);

    expect(response.isRight(), true);
    expect(response.fold(id, id), isA<ListMovieEntity>());
    verify(() => repository.getAllMovies(page)).called(1);
  });
}
