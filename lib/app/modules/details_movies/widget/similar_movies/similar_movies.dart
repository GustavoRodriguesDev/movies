import 'package:flutter/material.dart';
import 'package:movies/app/core/modules/movies/interactor/state/movie_state.dart';

import '../../../../core/widgets/card/movie_card.dart';
import '../../../../core/widgets/dialgo/details_dialog.dart';
import '../../../../core/widgets/shimmer/movie_card_shimmer.dart';
import '../../../../get_it.dart';
import 'store/similar_movie_store.dart';

class SimilarMoviesWidget extends StatefulWidget {
  final int movieId;
  const SimilarMoviesWidget({required this.movieId, super.key});

  @override
  State<SimilarMoviesWidget> createState() => _SimilarMoviesWidgetState();
}

class _SimilarMoviesWidgetState extends State<SimilarMoviesWidget> {
  final similarMovieStore = getIt<SimilarMovieStore>();
  @override
  void initState() {
    super.initState();
    similarMovieStore.fetchSimilarMovies(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          'Filmes Similares',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.06,
          ),
        ),
        SizedBox(
          height: 350,
          width: width,
          child: ValueListenableBuilder<MovieState>(
            valueListenable: similarMovieStore,
            builder: (context, value, child) {
              switch (value) {
                case EmptyMovieState():
                  return Container();

                case LoadingMovieState():
                  return ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        child: const MovieCardShimmer(),
                      );
                    },
                  );

                case ErrorMovieState(error: var error):
                  return Text(
                    error.message,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: width * 0.06,
                    ),
                  );

                case SuccesMovieState(listMovies: var value):
                  return ListView.builder(
                    itemCount: value.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = value[index];
                      return Container(
                        height: height * 0.30,
                        width: width * 0.45,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return DetailsDialog(
                                  descripition: movie.overview,
                                  pathImage: movie.posterPath,
                                  title: movie.title,
                                );
                              },
                            );
                          },
                          child: MovieCard(
                            pathImage: movie.posterPath,
                            nameMovie: movie.title,
                            ratingMovie: movie.voteAverage.toDouble(),
                          ),
                        ),
                      );
                    },
                  );
              }
            },
          ),
        )
      ],
    );
  }
}
