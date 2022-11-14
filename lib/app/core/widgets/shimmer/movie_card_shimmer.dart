import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardShimmer extends StatefulWidget {
  const MovieCardShimmer({Key? key}) : super(key: key);

  @override
  State<MovieCardShimmer> createState() => _MovieCardShimmerState();
}

class _MovieCardShimmerState extends State<MovieCardShimmer> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.30,
      width: width * 0.45,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.05),
        ),
      ),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 700),
        baseColor: Colors.white,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
    );
  }
}
