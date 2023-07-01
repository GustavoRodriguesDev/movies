import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/app/modules/search_movie/store/search_movie_store.dart';

import 'core/constants/movies_api.dart';
import 'core/service/http_service/http_service.dart';
import 'modules/cast/repository/cast_repository.dart';
import 'modules/cast/repository/datasource/cast_datasource.dart';
import 'modules/cast/repository/datasource/i_cast_datasource.dart';
import 'modules/cast/repository/i_cast_repository.dart';
import 'modules/details_movies/store/details_movies_store.dart';
import 'modules/home/store/home_store.dart';
import 'modules/movies/repository/datasource/i_movies_datasource.dart';
import 'modules/movies/repository/datasource/movies_datasource.dart';
import 'modules/movies/repository/i_movies_repository.dart';
import 'modules/movies/repository/moview_repository.dart';

final getIt = GetIt.instance;

void setup() {
  //SERVICE
  getIt.registerFactory<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        queryParameters: {
          'api_key': 'fda8099f4436a999739a94af37f5873d',
          'language': 'pt-BR',
        },
      ),
    ),
  );
  getIt.registerSingleton<IHttpService>(HttpService(getIt.get<Dio>()));
  //DATASOUCE
  //
  //movie module
  getIt.registerSingleton<IMoviesDatasource>(
      MoviesDatasource(getIt.get<IHttpService>()));

  //cast module
  getIt.registerSingleton<ICastDatasource>(
      CastDatasource(getIt.get<IHttpService>()));

  //INFRA
  //
  //movie module
  getIt.registerSingleton<IMoviesRepository>(
      MoviesRepository(getIt.get<IMoviesDatasource>()));

  //cast module
  getIt.registerSingleton<ICastRepository>(
      CastRepository(getIt.get<ICastDatasource>()));

  //USECASE
  //
  //movie module

  //STORE
  //
  //home module
  getIt.registerSingleton<HomeStore>(HomeStore(getIt.get<IMoviesRepository>()));
  getIt.registerSingleton<DetaisMoviesStore>(
    DetaisMoviesStore(
      actoresMovies: getIt.get<ICastRepository>(),
      moviesRepository: getIt.get<IMoviesRepository>(),
    ),
  );
  getIt.registerSingleton<SearchMovieStore>(
      SearchMovieStore(getIt.get<IMoviesRepository>()));
}
