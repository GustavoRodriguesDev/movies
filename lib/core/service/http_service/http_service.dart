import 'package:dio/dio.dart';
import 'package:movies/core/service/http_service/response_http_service.dart';

import '../../error/errors.dart';

abstract class IHttpService {
  Future<ResponseHttpService> get(String url, {Map<String, dynamic>? queryParameters});
}

class HttpService implements IHttpService {
  final Dio dio;

  HttpService(this.dio) {
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': 'fda8099f4436a999739a94af37f5873d',
        'language': 'pt-BR',
      },
    );
  }
  @override
  Future<ResponseHttpService> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return ResponseHttpService(response.data);
    } on DioError catch (e, s) {
      throw ServiceError(message: e.message, stackTrace: s);
    }
  }
}
