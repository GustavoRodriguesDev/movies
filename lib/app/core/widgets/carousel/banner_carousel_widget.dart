import 'package:flutter/material.dart';
import 'package:movies/app/core/modules/movies/domain/entities/movie_entity.dart';

import '../../constants/movies_api.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: NetworkImage(
              ApiConstants.image + movie.backdropPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: 30,
          color: const Color(0xFF1B2230).withOpacity(0.7),
          child: Center(
            child: Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
