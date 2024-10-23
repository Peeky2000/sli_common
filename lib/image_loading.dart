import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoading extends StatelessWidget {
  const ImageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
