import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/app/modules/search_movie/store/search_movie_store.dart';

import 'core/constants/movies_api.dart';
import 'core/service/http_service/http_service.dart';
import 'core/modules/cast/data/service/cast_service.dart';
import 'core/modules/cast/interactor/service/i_cast_repository.dart';
import 'modules/details_movies/widget/cast_movie/cast_movie_store/cast_movie_store.dart';
import 'modules/details_movies/widget/similar_movies/store/similar_movie_store.dart';
import 'modules/home/store/home_store.dart';
import 'core/modules/movies/data/service/moview_service.dart';
import 'core/modules/movies/interactor/service/i_movies_repository.dart';

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

  //DATA
  //
  //movie module
  getIt.registerSingleton<IMoviesService>(
      MoviesService(getIt.get<IHttpService>()));

  //DATA
  //
  //cast module
  getIt.registerSingleton<ICastService>(CastService(getIt.get<IHttpService>()));

  //Controller
  //
  //home module
  getIt.registerSingleton<HomeStore>(HomeStore(getIt.get<IMoviesService>()));

  getIt.registerSingleton<CastMovieStore>(
    CastMovieStore(
      getIt.get<ICastService>(),
    ),
  );

  getIt.registerSingleton<SearchMovieStore>(
      SearchMovieStore(getIt.get<IMoviesService>()));

  getIt.registerFactory(() => SimilarMovieStore(getIt.get<IMoviesService>()));
}
