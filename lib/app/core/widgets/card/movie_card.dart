import 'package:flutter/material.dart';
import '../componentes/star_rating.dart';

class MovieCard extends StatelessWidget {
  final String pathImage;
  final String nameMovie;
  final double ratingMovie;
  const MovieCard({
    Key? key,
    required this.pathImage,
    required this.nameMovie,
    required this.ratingMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.30,
          width: width * 0.45,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(width * 0.05)), color: Colors.white.withOpacity(0.1)),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500$pathImage',
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Text('Image not found'));
            },
            loadingBuilder: (_, widget, image) {
              if (image == null) {
                return widget;
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameMovie,
                style: const TextStyle(color: Colors.white),
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
    );
  }
}
