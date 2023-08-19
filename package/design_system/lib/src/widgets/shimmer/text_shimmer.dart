import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class TextShimmer extends StatefulWidget {
  const TextShimmer({Key? key}) : super(key: key);

  @override
  State<TextShimmer> createState() => _TextShimmerState();
}

class _TextShimmerState extends State<TextShimmer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: width * 0.05,
      width: width * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 700),
        baseColor: Colors.white,
        highlightColor: Colors.grey[400]!,
        child: Container(
          height: width * 0.05,
          width: width * 0.22,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
    );
  }
}
