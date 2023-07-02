import 'package:movies/app/modules/cast/interactor/service/i_cast_repository.dart';
import 'package:movies/app/modules/cast/interactor/state/cast_state.dart';

import '../../../../core/constants/movies_api.dart';
import '../../../../core/error/errors.dart';
import '../../../../core/service/http_service/http_service.dart';
import '../../interactor/types/types_cast.dart';
import '../adpter/cast_mapper.dart';

class CastRepository implements ICastRepository {
  final IHttpService http;

  CastRepository(this.http);

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
