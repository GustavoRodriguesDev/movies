import 'package:flutter/material.dart';

import '../componentes/image_poster.dart';

class DetailsDialog extends StatelessWidget {
  final String title;
  final String descripition;
  final String pathImage;
  const DetailsDialog({
    super.key,
    required this.title,
    required this.descripition,
    required this.pathImage,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: width * 0.8,
        constraints: BoxConstraints(
          maxHeight: height * 0.8,
        ),
        padding: EdgeInsets.only(
          top: width * 0.05,
          left: width * 0.02,
          right: width * 0.02,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.05),
            color: const Color(0xFF1B2230),
            border: Border.all(color: Colors.white)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.06,
                ),
              ),
              SizedBox(height: width * 0.04),
              SizedBox(
                height: height * 0.30,
                width: width * 0.45,
                child: ImagePoster(
                  pathImage: pathImage,
                ),
              ),
              SizedBox(height: width * 0.04),
              Text(
                descripition,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: width * 0.04,
                ),
              ),
              SizedBox(height: width * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
