import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/constants/movies_api.dart';
import 'core/service/http_service/http_service.dart';
import 'modules/home/store/home_store.dart';
import 'modules/movies/domain/repository/movies_repository.dart';
import 'modules/movies/domain/usecase/fetch_all_movies_usecase.dart';
import 'modules/movies/domain/usecase/search_movie.dart';
import 'modules/movies/external/datasource/movies_datasource.dart';
import 'modules/movies/infra/datasource/movies_datasource.dart';
import 'modules/movies/infra/repository/moview_repository.dart';
import 'modules/search_movie/store/search_movie_store.dart';

final getIt = GetIt.instance;

void setup() {
  // getIt.registerSingleton<AppModel>(AppModel());

  // Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());}
  getIt.registerFactory<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: MovieConstants.baseUrl,
        queryParameters: {
          'api_key': 'fda8099f4436a999739a94af37f5873d',
          'language': 'pt-BR',
        },
      ),
    ),
  );
  getIt.registerSingleton<IHttpService>(HttpService(getIt.get<Dio>()));
  getIt.registerSingleton<IMoviesDatasource>(MoviesDatasource(getIt.get<IHttpService>()));
  getIt.registerSingleton<IMoviesRepository>(MoviesRepository(getIt.get<IMoviesDatasource>()));
  getIt.registerSingleton<IFetchAllMoviesUsecase>(FetchAllMoviesUsecase(getIt.get<IMoviesRepository>()));
  getIt.registerSingleton<ISearchMovieUsecase>(SearchMovieUsecase(getIt.get<IMoviesRepository>()));
  getIt.registerSingleton<HomeStore>(HomeStore(getIt.get<IFetchAllMoviesUsecase>()));
  getIt.registerSingleton<SearchMovieStore>(SearchMovieStore(getIt.get<ISearchMovieUsecase>()));
}
