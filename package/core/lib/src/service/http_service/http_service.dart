import 'package:dio/dio.dart';

import '../../error/errors.dart';
import 'response_http_service.dart';

abstract class IHttpService {
  Future<ResponseHttpService> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  });
}

class HttpService implements IHttpService {
  final Dio dio;

  HttpService(this.dio);
  @override
  Future<ResponseHttpService> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return ResponseHttpService(
        data: response.data,
        statusCode: response.statusCode!,
      );
    } on DioError catch (e, s) {
      throw ServiceError(message: e.message, stackTrace: s);
    }
  }
}
