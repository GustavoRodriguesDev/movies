import 'package:movies/app/core/modules/cast/interactor/service/i_cast_repository.dart';
import 'package:movies/app/core/modules/cast/interactor/state/cast_state.dart';

import '../../../../constants/movies_api.dart';
import '../../../../error/errors.dart';
import '../../../../service/http_service/http_service.dart';
import '../../interactor/types/types_cast.dart';
import '../adpter/cast_mapper.dart';

class CastService implements ICastService {
  final IHttpService http;

  CastService(this.http);

  @override
  ReturnFetchActoresMovies getAllActores(int movieId) async {
    try {
      final response = await http
          .get('${ApiConstants.movie}/$movieId${ApiConstants.credits}');

      final listCast = CastMapper.fromMap(response.data['cast']);

      return SuccesCastState(listCast: listCast);
    } on Failure catch (e) {
      return ErrorCastState(failure: e);
    }
  }
}
