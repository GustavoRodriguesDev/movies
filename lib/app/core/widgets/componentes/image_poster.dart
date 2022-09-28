import 'package:flutter/material.dart';
import '../../constants/movies_api.dart';
import '../card/movie_card_shimmer.dart';

class ImagePoster extends StatelessWidget {
  final String pathImage;
  const ImagePoster({Key? key, required this.pathImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.30,
      width: width * 0.45,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(width * 0.05)),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Image.network(
        MovieConstants.image + pathImage,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
              child: Text(
            'Image not found',
            style: TextStyle(color: Colors.white),
          ));
        },
        loadingBuilder: (_, widget, image) {
          if (image == null) {
            return widget;
          }
          return const MovieCardShimmer();
        },
      ),
    );
  }
}
