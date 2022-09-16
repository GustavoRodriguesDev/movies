import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  const StarRating({Key? key}) : super(key: key);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 30,
      width: width * 0.42,
      color: Colors.white,
      child: CustomPaint(
        painter: CustomStarRating(),
          child: SizedBox(
        height: 30,
        width: width * 0.42,
      )),
    );
  }
}
class CustomStarRating extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;
}