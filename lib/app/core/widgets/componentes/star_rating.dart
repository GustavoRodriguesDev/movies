import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  const StarRating({Key? key}) : super(key: key);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
          clipper: CortaEstrala(0.50),
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
    );
  }
}

class CortaEstrala extends CustomClipper<Path> {
  final double corte;

  CortaEstrala(this.corte);
  @override
  getClip(Size size) {
    Path caixa = Path()
          ..lineTo(0, 0)
          ..lineTo(size.width * corte, 0)
          ..lineTo(size.width * corte, size.height)
          ..lineTo(0, size.height)

//
        ;

    return caixa;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
