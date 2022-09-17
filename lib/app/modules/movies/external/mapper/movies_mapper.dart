import '../../domain/entities/movie_entity.dart';
import '../error/movie_mapper_error.dart';

class MoviesMapper {
  static List<MovieEntity> fromJson(List<dynamic> movies) {
    try {
      return movies
          .map(
            (e) => MovieEntity(
              adult: e['adult'],
              backdropPath: e['backdrop_path'],
              genreIds: e['genre_ids'],
              movieID: e['id'],
              originalLanguage: e['original_language'],
              originalTitle: e['original_title'],
              overview: e['overview'],
              popularity: e['popularity'],
              posterPath: e['poster_path'],
              releaseDate: e['release_date'],
              title: e['title'],
              voteAverage: e['vote_average'],
              voteCount: e['vote_count'],
            ),
          )
          .toList();
    } catch (e, s) {
      throw MovieMapperError(message: e.toString(), stackTrace: s);
    }
  }
}
