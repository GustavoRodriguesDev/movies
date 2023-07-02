import '../../interactor/error/movie_mapper_error.dart';
import '../../interactor/model/movie_model.dart';

class MoviesMapper {
  static List<MovieModel> fromJson(List<dynamic> movies) {
    try {
      return movies.map(
        (e) {
          return MovieModel(
            adult: e['adult'],
            backdropPath: e['backdrop_path'] ?? '',
            genreIds: e['genre_ids'],
            movieID: e['id'],
            originalLanguage: e['original_language'],
            originalTitle: e['original_title'],
            overview: e['overview'],
            popularity: e['popularity'],
            posterPath: e['poster_path'] ?? '',
            releaseDate: e['release_date'],
            title: e['title'],
            voteAverage: e['vote_average'],
            voteCount: e['vote_count'],
          );
        },
      ).toList();
    } catch (e, s) {
      throw MovieMapperError(message: e.toString(), stackTrace: s);
    }
  }
}
