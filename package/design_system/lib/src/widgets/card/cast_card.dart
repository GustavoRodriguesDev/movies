import 'package:flutter/material.dart';

import '../shimmer/cast_card_shimmer.dart';

class CastCard extends StatefulWidget {
  final String castImage;
  final String castName;
  final void Function()? onTap;
  const CastCard(
      {Key? key,
      required this.castImage,
      required this.castName,
      required this.onTap})
      : super(key: key);

  @override
  State<CastCard> createState() => _CastCardState();
}

class _CastCardState extends State<CastCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            height: width * 0.22,
            width: width * 0.22,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: widget.castImage.isEmpty ? Border.all() : null,
            ),
            child: Image.network(
              widget.castImage,
              fit: BoxFit.cover,
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
                fontSize: width * 0.04,
              ),
            ),
          )
        ],
      ),
    );
  }
}
