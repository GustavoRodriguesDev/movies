import 'package:flutter/material.dart';
import '../../constants/movies_api.dart';
import '../shimmer/movie_card_shimmer.dart';

class ImagePoster extends StatelessWidget {
  final String pathImage;
  const ImagePoster({Key? key, required this.pathImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(width * 0.05)),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Image.network(
        ApiConstants.image + pathImage,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(
              Icons.broken_image_outlined,
            ),
          );
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
