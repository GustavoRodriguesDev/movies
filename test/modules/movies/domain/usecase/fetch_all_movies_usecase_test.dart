import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/modules/movies/domain/dto/pagination_movie_dto.dart';
import 'package:movies/modules/movies/domain/entities/list_movies_entity.dart';
import 'package:movies/modules/movies/domain/repository/fetch_all_moview_repository.dart';
import 'package:movies/modules/movies/domain/usecase/fetch_all_movies_usecase.dart';

class FetchAllMoviesRepositoryMock extends Mock implements IFetchAllMoviesRepository {}

void main() {
  late IFetchAllMoviesRepository repository;
  late IFetchAllMoviesUsecase usecase;

  setUpAll(() {
    repository = FetchAllMoviesRepositoryMock();
    usecase = FetchAllMoviesUsecase(repository);
  });
  
  PaginationMovieDto page = const PaginationMovieDto();
  ListMovieEntity entity = const ListMovieEntity();

  test('Deve retornar uma lista de MoviesEntity quando o metood for chamado', () async {

    when(() => repository.get(page)).thenAnswer((_) async => Right(entity));

    final response = await usecase(page);

    expect(response.isRight(), true);
    expect(response.fold(id, id), isA<ListMovieEntity>());
    verify(() => repository.get(page)).called(1);
  });
}
