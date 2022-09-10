class MovieEntity {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int movieID;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  const MovieEntity({
    this.adult = false,
    this.backdropPath = '',
    this.genreIds = const [],
    this.movieID = -1,
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = -1,
    this.posterPath = '',
    this.releaseDate = '',
    this.title = '',
    this.voteAverage = -1,
    this.voteCount = -1,
  });

  MovieEntity copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? movieID,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieEntity(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      movieID: movieID ?? this.movieID,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}
