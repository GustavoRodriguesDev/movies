import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;

  const StarRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Row(
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star_border_purple500_outlined,
                color: Colors.white,
              ),
            ),
          ),
          ClipPath(
            clipper: ClipStar(widget.rating / 10),
            child: Row(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipStar extends CustomClipper<Path> {
  final double clip;

  ClipStar(this.clip);
  @override
  getClip(Size size) {
    Path caixa = Path()
          ..lineTo(0, 0)
          ..lineTo(size.width * clip, 0)
          ..lineTo(size.width * clip, size.height)
          ..lineTo(0, size.height)

//
        ;

    return caixa;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
