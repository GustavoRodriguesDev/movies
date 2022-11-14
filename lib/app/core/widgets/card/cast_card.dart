import 'package:flutter/material.dart';
import '../../constants/movies_api.dart';
import '../shimmer/cast_card_shimmer.dart';

class CastCard extends StatefulWidget {
  final String castImage;
  final String castName;
  const CastCard({Key? key, required this.castImage, required this.castName}) : super(key: key);

  @override
  State<CastCard> createState() => _CastCardState();
}

class _CastCardState extends State<CastCard> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: width * 0.22,
          width: width * 0.22,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.network(
            ApiConstants.image + widget.castImage,
            fit: BoxFit.cover,
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

              return const CastCardShimmer();
            },
          ),
        ),
        SizedBox(height: width * 0.02),
        SizedBox(
          width: width * 0.22,
          child: Text(
            widget.castName,
            // overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: width * 0.04,
            ),
          ),
        )
      ],
    );
  }
}
