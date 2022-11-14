import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CastCardShimmer extends StatefulWidget {
  const CastCardShimmer({Key? key}) : super(key: key);

  @override
  State<CastCardShimmer> createState() => _CastCardShimmer();
}

class _CastCardShimmer extends State<CastCardShimmer> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Container(
      height: 90,
      width: 90,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 700),
        baseColor: Colors.white,
        highlightColor: Colors.grey[400]!,
        child: Container(
          height: 70,
          width: 70,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
    );
  }
}
