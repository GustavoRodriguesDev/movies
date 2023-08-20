import 'package:flutter/material.dart';

import '../componentes/image_poster.dart';
import '../componentes/star_rating.dart';

class MovieCard extends StatelessWidget {
  final String pathImage;
  final String nameMovie;
  final double ratingMovie;

  final void Function()? onTap;
  const MovieCard({
    Key? key,
    required this.pathImage,
    required this.nameMovie,
    required this.ratingMovie,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImagePoster(
            pathImage: pathImage,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Tooltip(
                    message: nameMovie,
                    child: Text(
                      nameMovie,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return StarRating(
                      rating: ratingMovie,
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
