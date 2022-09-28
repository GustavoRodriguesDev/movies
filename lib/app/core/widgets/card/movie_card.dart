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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImagePoster(
            pathImage: pathImage,
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.04,
                  child: Text(
                    nameMovie,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return StarRating(
                      rating: ratingMovie,
                      width: width * 0.306,
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
