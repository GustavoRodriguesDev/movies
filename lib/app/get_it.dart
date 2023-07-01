import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/app/modules/search_movie/store/search_movie_store.dart';
import 'package:movies/app/modules/movies/domain/usecase/fetch_similar_movies_usecase.dart';

import 'core/constants/movies_api.dart';
import 'core/service/http_service/http_service.dart';
import 'modules/cast/repository/cast_repository.dart';
import 'modules/cast/repository/datasource/cast_datasource.dart';
import 'modules/cast/repository/datasource/i_cast_datasource.dart';
import 'modules/cast/repository/i_cast_repository.dart';
import 'modules/home/store/home_store.dart';
import 'modules/details_movies/store/details_movies_store.dart';
import 'modules/movies/domain/repository/movies_repository.dart';
import 'modules/movies/domain/usecase/fetch_all_movies_usecase.dart';
import 'modules/movies/domain/usecase/search_movie.dart';
import 'modules/movies/external/datasource/movies_datasource.dart';
import 'modules/movies/infra/datasource/movies_datasource.dart';
import 'modules/movies/infra/repository/moview_repository.dart';

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
  getIt.registerSingleton<IFetchAllMoviesUsecase>(
      FetchAllMoviesUsecase(getIt.get<IMoviesRepository>()));
  getIt.registerSingleton<ISearchMovieUsecase>(
      SearchMovieUsecase(getIt.get<IMoviesRepository>()));
  getIt.registerSingleton<IFetchSimilarMoviesUsecase>(
      FetchSimilarMoviesUsecase(getIt.get<IMoviesRepository>()));

  //STORE
  //
  //home module
  getIt.registerSingleton<HomeStore>(
      HomeStore(getIt.get<IFetchAllMoviesUsecase>()));
  getIt.registerSingleton<DetaisMoviesStore>(
    DetaisMoviesStore(
      actoresMovies: getIt.get<ICastRepository>(),
      fetchSimilarMoviesUsecase: getIt.get<IFetchSimilarMoviesUsecase>(),
    ),
  );
  getIt.registerSingleton<SearchMovieStore>(
      SearchMovieStore(getIt.get<ISearchMovieUsecase>()));
}
