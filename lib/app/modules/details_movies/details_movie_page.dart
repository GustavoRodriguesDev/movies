import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:movies/app/modules/details_movies/store/state/state_details_movies.dart';

import '../../shared/constants/movies_api.dart';
import 'store/details_movies_store.dart';
import 'widget/rating_movie.dart';

class DetailsMovie extends StatefulWidget {
  final String imageBackgroud;
  final String imagePoster;
  final String nameMovie;
  final double rating;
  final int votes;
  final String description;
  final DetaisMoviesStore detaisMoviesStore;
  final int movieId;
  const DetailsMovie({
    Key? key,
    required this.imageBackgroud,
    required this.nameMovie,
    required this.rating,
    required this.votes,
    required this.description,
    required this.detaisMoviesStore,
    required this.movieId,
    required this.imagePoster,
  }) : super(key: key);

  @override
  State<DetailsMovie> createState() => _DetailsMovieState();
}

class _DetailsMovieState extends State<DetailsMovie> {
  DetaisMoviesStore get detaisMoviesStore => widget.detaisMoviesStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    detaisMoviesStore.initalDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: height * 0.35,
                  width: width,
                  child: Image.network(
                    ApiConstants.image + widget.imageBackgroud,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                          child: Text(
                        'Image not found',
                      ));
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height * 0.15,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Theme.of(context).colorScheme.background,
                          Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.2),
                          Colors.transparent
                        ],
                        stops: const [0.0, 0.6, 1],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.05,
                  left: width * 0.83,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: width * 0.1,
                      width: width * 0.1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceVariant
                            .withOpacity(0.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: width * 0.08,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingMovie(
                    rating: widget.rating,
                    votes: widget.votes,
                  ),
                  SizedBox(height: width * 0.04),
                  Text(
                    widget.nameMovie,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: width * 0.04,
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  Text(
                    'Elenco',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  SizedBox(
                    height: width * 0.42,
                    width: width,
                    child: ValueListenableBuilder<DetailsMoviesState>(
                      valueListenable: detaisMoviesStore,
                      builder: (context, value, child) {
                        if (value is LoadingDetailsMoviesState) {
                          return ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Column(
                                  children: [
                                    const CastCardShimmer(),
                                    SizedBox(height: width * 0.02),
                                    const TextShimmer(),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        if (value is ErrorDetailsMoviesState) {
                          return Text(
                            'Elenco não encontrado',
                            style: TextStyle(
                              fontSize: width * 0.06,
                            ),
                          );
                        }
                        if (value is SuccessDetailsMoviesState) {
                          return ListView.builder(
                            itemCount: value.listCast.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final cast = value.listCast[index];
                              precacheImage(
                                Image.network(
                                  ApiConstants.image + cast.profilePath,
                                ).image,
                                context,
                              );
                              return CastCard(
                                castImage: cast.profilePath,
                                castName: cast.originalName,
                                onTap: cast.profilePath.isEmpty
                                    ? null
                                    : () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child: ImagePoster(
                                                  pathImage: cast.profilePath),
                                            );
                                          },
                                        );
                                      },
                              );
                            },
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  Text(
                    'Filmes Similares',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  SizedBox(
                    height: 360,
                    width: width,
                    child: ValueListenableBuilder(
                      valueListenable: detaisMoviesStore,
                      builder: (context, value, child) {
                        if (value is LoadingDetailsMoviesState) {
                          return ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(6),
                                child: const MovieCardShimmer(),
                              );
                            },
                          );
                        }
                        if (value is ErrorDetailsMoviesState) {
                          return Text(
                            'Filmes não econtrados',
                            style: TextStyle(
                              fontSize: width * 0.06,
                            ),
                          );
                        }
                        if (value is SuccessDetailsMoviesState) {
                          return ListView.builder(
                            itemCount: value.movieEntity.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final movie = value.movieEntity[index];
                              return Container(
                                height: height * 0.30,
                                width: width * 0.45,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
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
                                      ratingMovie:
                                          movie.voteAverage.toDouble()),
                                ),
                              );
                            },
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
