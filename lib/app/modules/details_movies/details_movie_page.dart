import 'package:flutter/material.dart';
import 'package:movies/app/modules/details_movies/widget/similar_movies/similar_movies.dart';

import '../../core/constants/movies_api.dart';
import 'widget/cast_movie/cast_movie_widget.dart';
import 'widget/rating_movie.dart';

class DetailsMovie extends StatefulWidget {
  final String imageBackgroud;
  final String imagePoster;
  final String nameMovie;
  final double rating;
  final int votes;
  final String description;

  final int movieId;
  const DetailsMovie({
    Key? key,
    required this.imageBackgroud,
    required this.nameMovie,
    required this.rating,
    required this.votes,
    required this.description,
    required this.movieId,
    required this.imagePoster,
  }) : super(key: key);

  @override
  State<DetailsMovie> createState() => _DetailsMovieState();
}

class _DetailsMovieState extends State<DetailsMovie> {
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
                        style: TextStyle(color: Colors.white),
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
                          const Color(0xFF1B2230),
                          const Color(0xFF1B2230).withOpacity(0.2),
                          Colors.transparent,
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
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: width * 0.08,
                        color: Colors.white,
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: width * 0.04,
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  CastMovieWidget(
                    movieId: widget.movieId,
                  ),
                  SimilarMoviesWidget(
                    movieId: widget.movieId,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
